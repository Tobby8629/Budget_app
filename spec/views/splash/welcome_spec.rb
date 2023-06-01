require 'rails_helper'

RSpec.describe Category, type: :system do
  describe 'splash page' do
    before :each do
      visit root_path
    end

    it 'display app name' do
      expect(page).to have_content 'Exchange budget'
    end

    it 'display hello' do
      click_on 'Sign in'
      expect(page).to have_content 'Log in'
    end

    it 'display hello' do
      click_on 'Sign up'
      expect(page).to have_content 'Sign up'
    end
  end
end
