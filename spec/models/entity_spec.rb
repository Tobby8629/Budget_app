require 'rails_helper'

RSpec.describe Entity, type: :model do
  let(:user) { User.create(firstname: 'tobby', lastname: 'samuels', email: 'tobby@example.com', password: 'samuel') }
  let(:entity) { Entity.create(name: 'mercedes', amount: 2000, author_id: user.id) }

  describe 'is entity valid' do
    it 'should be valid' do
      expect(entity).to be_valid
    end

    it 'return invalid if name is null' do
      entity.name = nil
      expect(entity).to_not be_valid
    end

    it 'not be valid if amount is string' do
      entity.amount = 'weee'
      expect(entity).to_not be_valid
    end

    it 'should not be valid if amount is less than 0' do
      entity.amount = -1
      expect(entity).to_not be_valid
    end
  end
end
