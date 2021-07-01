class User < ActiveRecord::Base
    has_many :likes, dependent: :destroy
    validates :name, :presence => true

    #All likes
    scope :likes, -> {where(likes)}

    #scope :likes.books, -> {where(likes.ref_type: "books")}

    def like_books
        result = User.likes.where(ref_type: 'books')
        #result = User.joins(:likes).where(:likes: {ref_type: 'books'})
        puts result.as_json
    end


    #Likes in livros
    #scope :likes.books, -> {where(likes)}
    #scope :likes.books -> {joins(books)}

    #Likes in authors
    #scope :likes, -> {where(likes)}

    #likes in users
    #scope :likes, -> {where(likes)}

    #likes in editora
    #scope :likes, -> {where(likes)}
end
