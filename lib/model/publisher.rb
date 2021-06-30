class Publisher < ActiveRecord::Base
    has_many :books, dependent: :destroy
    validates :name, :presence => true

    scope :books, -> where{books.name}
end