class Book < ActiveRecord::Base
    belongs_to :publisher

    #Informo que livros pode ter varios autores (automaticament ele utiliza a tabela de associacao)
    has_and_belongs_to_many :authors
end