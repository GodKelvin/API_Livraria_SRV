require 'sinatra'
require 'sinatra/activerecord'
require 'mysql2'
#set :database, {adapter: "mysql2", database: "livraria_SRV.mysql2"}

#importando as rotas
require_relative 'lib/routes/init'

#Configuracao do banco de dados
require_relative 'config/config_db.rb'
