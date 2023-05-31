require 'rails_helper'

RSpec.describe Exchange, type: :model do
  let(:user) { User.create(firstname: 'tobby', lastname: 'samuels', email: 'tobby@example.com', password: 'samuel') }
  let(:exchange) { Exchange.create(name: 'mercedes', amount: 2000, author_id: user.id) }

  describe 'is exchange valid' do
    it 'should be valid' do
      expect(exchange).to be_valid
    end

    it 'return invalid if name is null' do
      exchange.name = nil
      expect(exchange).to_not be_valid
    end

    it 'not be valid if amount is string' do
      exchange.amount = 'weee'
      expect(exchange).to_not be_valid
    end

    it 'should not be valid if amount is less than 0' do
      exchange.amount = -1
      expect(exchange).to_not be_valid
    end

    it 'author_id is not present' do
      exchange.author_id = nil
      expect(exchange).to_not be_valid
    end
  end
end
