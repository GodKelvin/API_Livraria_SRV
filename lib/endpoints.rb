require 'sinatra/namespace'
require 'sinatra/reloader'
require 'sinatra/contrib'
require 'net/http'
require 'json'

#Especifica para todas as rotas que o return eh um JSON
before do
    content_type :json
end

#Permitir requisicoes fora do IP local
set :bind, "0.0.0.0"

class Livro <ActiveRecord::Base
end

get('/') do
    puts Livro.all
    halt(200, {message: "Hello World!. Devesenvolvidor por Kelvin Lehrback. Real Seguro Viagem"}.to_json)
end

namespace('/api/v1/convert') do
    #Recebe a moeda e o valor em real para converter
    #Exemplo de uso: Dollar / 10. Ou seja, vai converter 10 reais em Dollar.
    get('/:moeda/:valor_real') do |moeda, valor_real|
        #puts moeda, valor_real
        begin
            uri = URI("https://economia.awesomeapi.com.br/json/last/#{moeda}")
            response = Net::HTTP.get(uri)
            dados_moeda = JSON.parse(response)
            moeda = moeda.split('-').join()
            if(dados_moeda['status'] === 404)
                halt(404, dados_moeda.to_json)
            else
                #valor_calculado = dados_moeda[moeda]['bid'].to_f * valor_real.to_f
                valor_calculado = valor_real.to_f / dados_moeda[moeda]['bid'].to_f
                res = {
                    "#{moeda}": dados_moeda[moeda]['bid'].to_f,
                    "REAL": valor_real.to_f,
                    "REAL_em_#{moeda}": valor_calculado
                }.to_json   
                halt(200, res)
            end
        rescue Exception => error
            halt(500, {error: error.message}.to_json)
        end
    end
end

