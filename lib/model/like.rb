class Like < ActiveRecord::Base
    belongs_to :user
    validates :user_id, :ref_type, :ref_id, :presence => true
end
