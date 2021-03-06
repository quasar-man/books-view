class Book < ApplicationRecord
  belongs_to :publisher
  has_many_attached :book_images
  has_one :book_review
  has_many :categorizes
  has_many :categories, through: :categorizes
  has_many :taggings
  has_many :tags, through: :taggings
  has_many :writings
  has_many :authors, through: :writings
end
