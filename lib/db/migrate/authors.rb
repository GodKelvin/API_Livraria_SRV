class Author < ActiveRecord::Migration[6.1]
    def create
        create_table :authors do |a|
            a.string :name
            a.date :born_date
        end
    end

    def drop
        drop_table(:authors, if_exists: true)
    end 
end
