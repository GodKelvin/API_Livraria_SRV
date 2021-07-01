class Addborndate < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :born_date, :date
  end
end
