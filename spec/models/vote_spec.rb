require 'rails_helper'

RSpec.describe Vote, type: :model do
  context 'associations' do
    it 'requires an article and a user to be valid' do
      author = create(:random_user)
      category = create(:category, name: 'Python', priority: 1)
      byebug
      article = create(:random_article, author_id: author.id, category_id: category.id)
      # byebug
      vote = build(:vote, author_id: author.id, article_id: article.id)
      expect(vote).to be_valid
    end

    it 'is not valid without an article nor an user' do
      vote = build(:vote, author_id: nil, article_id: nil)
      expect(vote).to_not be_valid
    end
  end
end
