class User < ApplicationRecord
  has_many :articles, class_name: 'User', foreign_key: 'author_id'
  has_many :votes, foreign_key: 'author_id'
  has_many :voted_articles, through: :votes
  validates :name, presence: true, uniqueness: true
end
