require 'rails_helper'

RSpec.describe Category, type: :model do
  context 'associations' do
    it 'requires an article to be valid' do
      author = create(:random_user)
      article = create(:random_article, user_id: author.id)
      category = build(:category, name: 'python', priority: 6, article_id: article.id)
      expect(category).to be_valid
    end

    it 'is not valid without an article' do
      category = build(:category, name: 'python', priority: 6, article_id: nil)
      expect(category).to_not be_valid
    end
  end
end
