class Article < ApplicationRecord
  belongs_to :user
  has_one :category
  has_many :votes
  validates :title, presence: true
  validates :text, presence: true
end
