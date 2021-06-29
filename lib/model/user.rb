class User < ActiveRecord::Base
    has_many :likes, dependent: :destroy
    validates :name, :presence => true
end
