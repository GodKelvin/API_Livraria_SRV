class Createauthors < ActiveRecord::Migration[6.1]
  def change
    create_table :authors_books do |a_b|
      a_b.references :book, foreign_key: {to_table: :books}
      a_b.references :author, foreign_key: {to_table: :authors}
    end
  end
end
