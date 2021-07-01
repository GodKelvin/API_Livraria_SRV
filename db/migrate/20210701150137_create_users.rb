class CreateUsers < ActiveRecord::Migration[6.1]
  def up
    create_table :teste_rakes do |tr|
      tr.string :name
      tr.date :born_date
      tr.float :valor_real
    end
  end
end