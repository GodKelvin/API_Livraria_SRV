require 'active_record'
require_relative 'config_bd'
require_relative 'schema/authors'
require_relative 'schema/publishers'
require_relative 'schema/books'
require_relative 'schema/authors_books'
require_relative 'schema/users'
require_relative 'schema/likes'


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




