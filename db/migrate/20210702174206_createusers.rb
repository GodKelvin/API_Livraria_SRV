class Createusers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |u|
      u.string :name
    end
  end
end
