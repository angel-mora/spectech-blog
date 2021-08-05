require 'rails_helper'

RSpec.describe User, type: :model do
  context 'associations' do
    let!(:user) { create(:random_user) }
    it 'ensures name presence' do
      expect(user.save).to eq(true)
    end
    it 'require name presence' do
      user.name = nil
      expect(user.save).to eq(false)
    end
  end
end
