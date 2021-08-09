class Book < ApplicationRecord
  belongs_to :publisher
  has_many :book_image
  has_one :book_review
  has_many :categories, through: :categorizes
  has_many :tags, through: :taggings
  has_many :authors, through: :writings
end
