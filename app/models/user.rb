class User < ApplicationRecord
  has_many :articles, class_name: 'User', foreign_key: 'author_id'
  has_many :votes, foreign_key: 'author_id'
  validates :name, presence: true, uniqueness: true

  def votes?
    article.votes.where(author_id: id).any?
  end
end
