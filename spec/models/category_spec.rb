require 'rails_helper'

RSpec.describe Category, type: :model do
  context 'associations' do
    it 'does not requires an article to be valid' do
      category = create(:category, name: 'Python', priority: 1)
      expect(category).to be_valid
    end

    it 'is valid without an article' do
      category = build(:category, name: 'python', priority: nil)
      expect(category).to_not be_valid
    end
  end
end
