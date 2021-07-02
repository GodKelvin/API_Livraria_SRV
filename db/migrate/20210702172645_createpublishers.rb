class Createpublishers < ActiveRecord::Migration[6.1]
  def change
    create_table :publishers do |p|
      p.string :name
    end
  end
end
