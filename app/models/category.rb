class Category < ApplicationRecord
  has_many :articles
  validates :priority, presence: true
end
