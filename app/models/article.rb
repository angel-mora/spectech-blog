class Article < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :votes
  validates :title, presence: true
  validates :text, presence: true
end
