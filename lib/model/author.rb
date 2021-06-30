class Author < ActiveRecord::Base
    #Informo que autores pode ter varios livros (automaticament ele utiliza a tabela de associacao)
    has_and_belongs_to_many :books
    validates :name, :born_date, :presence => true

    scope :books, -> where{books.name}
end
