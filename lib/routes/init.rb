require 'sinatra/namespace'
require 'sinatra/reloader'
require 'sinatra/contrib'
require 'json'

require_relative 'teste'
require_relative 'books'
require_relative 'publishers'
require_relative 'users'


#Especifica para todas as rotas que o return eh um JSON
before do
    content_type :json
end

#Permitir requisicoes fora do IP local
set :bind, "0.0.0.0"

get('/') do
    halt(200, {message: "Hello World!. Devesenvolvidor por Kelvin Lehrback. Real Seguro Viagem"}.to_json)
end

