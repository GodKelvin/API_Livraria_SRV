class User < ActiveRecord::Base
    has_many :likes, dependent: :destroy
    validates :name, :presence => true

    #All likes
    scope :likes, -> {where(likes)}

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
