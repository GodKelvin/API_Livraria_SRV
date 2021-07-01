class Publisher < ActiveRecord::Migration[6.1]
    def create 
        create_table :publishers do |p|
            p.string :name
        end
    end

    def drop
        drop_table(:publishers, if_exists: true)
    end
end
