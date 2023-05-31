require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.create(firstname: 'tobby', lastname: 'samuels', email: 'tobby@example.com', password: 'samuel') }

  describe 'create user' do
    it 'should create user' do
      expect(user).to be_valid
    end
  end

  describe 'validations' do
    it 'should be invalid, name must be present' do
      user.firstname = nil
      expect(user).to_not be_valid
    end

    it 'icon can be present' do
      user.lastname = nil
      expect(user).to_not be_valid
    end
  end
end
