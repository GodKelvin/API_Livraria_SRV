require 'sinatra/namespace'
require 'sinatra/reloader'
require 'sinatra/contrib'
require 'json'

require_relative 'livros'

#Especifica para todas as rotas que o return eh um JSON
before do
    content_type :json
end

#Permitir requisicoes fora do IP local
set :bind, "0.0.0.0"

get('/') do
    halt(200, {message: "Hello World!. Devesenvolvidor por Kelvin Lehrback. Real Seguro Viagem"}.to_json)
end

