require 'rails_helper'

RSpec.describe Category, type: :system do
  describe 'index view' do
    before :each do
      @user = User.create(firstname: 'tobby', lastname: 'sugar', email: 'tobby2@example.com', password: 'ayomide0803',
                          updated_at: '2023-05-22 17:16:58.291555', created_at: '2023-05-22 17:16:58.291555')
      @file = fixture_file_upload(Rails.root.join('spec', 'fixtures', 'files', 'mac.jpg'), 'image/jpeg')
      @cate = Category.create(name: 'beans', author_id: @user.id)
      @cate.icon.attach(@file)
      @transaction = Exchange.create(name: 'rice', amount: 200, author_id: @user.id)
      @transactionone = Exchange.create(name: 'beans', amount: 400, author_id: @user.id)
      @transactiontwo = Exchange.create(name: 'bread', amount: 600, author_id: @user.id)
      @cateex = CategoryExchange.create(category_id: @cate.id, exchange_id: @transaction.id)
      @cateexone = CategoryExchange.create(category_id: @cate.id, exchange_id: @transactionone.id)
      @cateextwo = CategoryExchange.create(category_id: @cate.id, exchange_id: @transactiontwo.id)

      visit category_path(@cate.id)
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      click_on 'Log in'
    end

    it 'should have a text category' do
      click_on 'Add Transaction'
      expect(page).to have_content('create Transaction')
    end

    it 'should have a text add category' do
      expect(page).to have_content('Add Transaction')
    end

    it 'should have a text add category' do
      click_on '<'
      expect(page).to have_content('CATEGORY')
    end

    it 'display all categories name' do
      categories = @cate.exchanges
      categories.each do |e|
        expect(page).to have_content e.name
      end
    end

    it 'display total amount of transactions' do
      total = @cate.exchanges.sum(:amount)
      expect(page).to have_content("$#{total}")
    end

    it 'display all categorie' do
      categories = @cate.exchanges
      categories.each do |e|
        expect(page).to have_content e.amount
      end
    end

    it 'should log user out of the app' do
      click_on 'sign out'
      expect(page).to have_content('Hello! welcome')
    end
  end
end
