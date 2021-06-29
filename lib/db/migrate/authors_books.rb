class AuthorBook < ActiveRecord::Migration[6.1]
    def create
        create_table :authors_books do |a_b|
            a_b.references :book, foreign_key: {to_table: :books}
            a_b.references :author, foreign_key: {to_table: :authors}
        end
    end


    def drop
        drop_table(:authors_books, if_exists: true)
    end
end