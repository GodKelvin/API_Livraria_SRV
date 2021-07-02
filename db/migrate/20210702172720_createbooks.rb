class Createbooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |b|
      b.string :name
      b.integer :published
      b.references :publisher, foreign_key: {to_table: :publishers}
    end
  end
end
