class User < ApplicationRecord
  has_many :articles
  has_many :votes
  validates :name, presence: true, uniqueness: true

  def votes?
    article.votes.where(user_id: id).any?
  end
end
