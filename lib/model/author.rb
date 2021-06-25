class Author < ActiveRecord::Base
    #has_many :author_books
    #indica que a associacao de livros com autoreseh atraves de author_livros
    #has_many :books, through: :author_books
    has_and_belongs_to_many :books
end
