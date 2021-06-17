class Article < ApplicationRecord
  belongs_to :user
  has_one :category
  has_many :votes
end
