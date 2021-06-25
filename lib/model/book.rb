class Book < ActiveRecord::Base
    belongs_to :publisher
    #has_many :author_books
    #indica que a associacao de livros com autoreseh atraves de author_livros
    has_many :authors, through: :author_books
    has_and_belongs_to_many :authors
end