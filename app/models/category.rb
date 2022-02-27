class Category < ApplicationRecord
  has_many :categorizes
  has_many :books, through: :categorizes
end
