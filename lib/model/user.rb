class User < ActiveRecord::Base
    has_many :likes, dependent: :destroy
end
