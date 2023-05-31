require 'rails_helper'

RSpec.describe Group, type: :model do
  let(:user) { User.create(firstname: 'tobby', lastname: 'samuels', email: 'tobby@example.com', password: 'samuel') }
  let(:group) { Group.new(name: 'auto', author_id: user.id) }

  describe 'create group' do
    it 'should create group' do
      expect(group).to be_valid
    end
  end

  describe 'validations' do
    it 'should be invalid, name must be present' do
      group.name = nil
      expect(group).to_not be_valid
    end

    it 'icon can be present' do
      group.icon = 'group'
      expect(group).to be_valid
    end

    it 'icon may not be present' do
      group.icon = nil
      expect(group).to be_valid
    end
  end
end
