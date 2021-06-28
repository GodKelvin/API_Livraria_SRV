require 'sinatra'
require 'sinatra/activerecord'
require 'mysql2'
#set :database, {adapter: "mysql2", database: "livraria_SRV.mysql2"}

#importando as rotas
require_relative 'lib/routes/init'

#Configuracao do banco de dados
ActiveRecord::Base.establish_connection(
    :adapter => "mysql2",
    :host => "localhost",
    :username => "kelvinbd",
    :password => "1998",
    :database => "livraria_SRV"
);
