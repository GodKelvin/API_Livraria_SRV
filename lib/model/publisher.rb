class Publisher < ActiveRecord::Base
    has_many :books, dependent: :destroy
end