class Book < ActiveRecord::Migration[6.1]
    def create
        create_table :books do |b|
            b.string :name
            b.integer :published
            b.references :publisher, foreign_key: {to_table: :publishers}
        end
    end


    def drop
        drop_table(:books, if_exists: true)
    end
end
