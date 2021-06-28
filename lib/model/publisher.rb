class Publisher < ActiveRecord::Base
    #belongs_to :book
    has_many :books, dependent: :destroy
end