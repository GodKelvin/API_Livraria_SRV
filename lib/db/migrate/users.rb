class User < ActiveRecord::Migration[6.1]
    def create
        create_table :users do |u|
            u.string :name
        end
    end

    def drop
        drop_table(:users, if_exists: true)
    end
end