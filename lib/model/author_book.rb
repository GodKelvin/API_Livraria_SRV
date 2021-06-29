class AuthorsBook < ActiveRecord::Base
    validates :book_id, :author_id, :presence => true
end
