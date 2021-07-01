class Like < ActiveRecord::Migration[6.1]
    def create
        create_table :likes do |l|
            l.references :user, foreign_key: {to_table: :users}
            l.string :ref_type
            l.integer :ref_id
        end
    end

    def drop
        drop_table(:likes, if_exists: true)
    end
end