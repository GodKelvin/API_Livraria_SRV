require 'active_record'
require_relative '../config_bd'
require_relative 'authors'
require_relative 'publishers'
require_relative 'books'
require_relative 'authors_books'
require_relative 'users'
require_relative 'likes'


#Criando a estrutura
books = Book.new
publishers = Publisher.new
authors = Author.new
users = User.new
authors_books = AuthorBook.new
likes = Like.new

authors_books.drop
books.drop
publishers.drop
authors.drop
likes.drop
users.drop

publishers.create
books.create
authors.create
authors_books.create
users.create
likes.create

#Inserindo dados na estrutura




