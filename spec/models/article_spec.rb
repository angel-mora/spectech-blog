require 'rails_helper'

RSpec.describe Article, type: :model do
  context 'associations' do
    it 'ensures presence of title and text' do
      author = create(:random_user)
      article = build(:random_article, user_id: author.id)
      expect(article.save).to eq(true)
    end
    it 'require presence of title and text' do
      author = build(:random_user)
      article = build(:random_article, title: nil, text: nil, user_id: author.id)
      expect(article).to_not be_valid
    end
  end
end
