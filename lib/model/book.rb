class Book < ActiveRecord::Base
    belongs_to :publisher
    #Informo que livros pode ter varios autores (automaticament ele utiliza a tabela de associacao)
    has_and_belongs_to_many :authors
    validates :name, publisher_id, :published, :presence => true

    def delete_all_likes
        Like.where("ref_type = ? AND ref_id = ?", "books", id).delete_all
    end
end