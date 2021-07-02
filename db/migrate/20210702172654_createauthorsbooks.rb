class Createauthorsbooks < ActiveRecord::Migration[6.1]
  def change
    create_table :authors do |a|
      a.string :name
      a.date :born_date
    end
  end
end
