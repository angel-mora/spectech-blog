class Article < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :votes
  validates :title, presence: true
  validates :text, presence: true
  has_one_attached :image

  def self.top_article
    return unless Vote.any?

    article_id = Vote.group(:article_id).count.max_by { |_, v| v }.first
    Article.find(article_id)
  end
end
