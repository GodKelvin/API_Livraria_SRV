class Createlikes < ActiveRecord::Migration[6.1]
  def change
    create_table :likes do |l|
      l.references :user, foreign_key: {to_table: :users}
      l.string :ref_type
      l.integer :ref_id
    end
  end
end
