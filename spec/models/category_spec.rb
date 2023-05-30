require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:user) { User.create(firstname: 'tobby', lastname: 'samuels', email: 'tobby@example.com', password: 'samuel') }
  let(:category) { Category.new(name: 'auto', author_id: user.id) }

  describe 'create category' do
    it 'should create category' do
      expect(category).to be_valid
    end
  end

  describe 'validations' do
    it 'should be invalid, name must be present' do
      category.name = nil
      expect(category).to_not be_valid
    end

    it 'author_id is not present' do
      category.author_id = nil
      expect(category).to_not be_valid
    end
  end
end
