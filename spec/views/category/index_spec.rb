require 'rails_helper'

RSpec.describe Category, type: :system do
  describe 'index view' do
    let(:file) { fixture_file_upload(Rails.root.join('spec', 'fixtures', 'files', 'mac.jpg'), 'iamge/jpeg') }
    before :each do
      @user = User.create(firstname: 'tobby', lastname: 'sugar', email: 'tobby2@example.com', password: 'ayomide0803',
                          updated_at: '2023-05-22 17:16:58.291555', created_at: '2023-05-22 17:16:58.291555')
      @transaction = Exchange.create(name: 'rice', amount: 200, author_id: @user.id)
      @cate = Category.create(name: 'beans', author_id: @user.id)
      @cate.icon.attach(file)
      @catetwo = Category.create(name: 'potatoes', author_id: @user.id)
      @catetwo.icon.attach(file)
      @cateex = CategoryExchange.create(category_id: @cate.id, exchange_id: @transaction.id)


      visit categories_path
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      click_on 'Log in'
    end

    it 'should have a text category' do
      click_on 'Add category'
      expect(page).to have_content('Create your category')
    end

    it 'should have a text category' do
      expect(page).to have_content('CATEGORY')
    end

    it 'should have a text add category' do
      expect(page).to have_content('Add category')
    end

    it 'should have a text add category' do
      click_on '<'
      expect(page).to have_content('CATEGORY')
    end

    it 'display all categorie' do
      categories = Category.all
      categories.each do |e|
        expect(page).to have_content e.name
      end
    end

    it 'display total amount of transactions' do
      total = @cate.exchanges.sum(:amount)
      expect(page).to have_content("$#{total}")
    end


    it 'display all categorie' do
      categories = Category.all
      categories.each do |e|
        click_on "remove #{e.name}"
        expect(page).to_not have_content e.name
      end
    end

    it 'display all categorie' do
      categories = Category.all
      categories.each do |e|
        click_on e.name
        expect(page).to have_content 'Add Transaction'
        click_on '<'
      end
    end

    it 'should log user out of the app' do
      click_on 'sign out'
      expect(page).to have_content('Hello! welcome')
    end
  end
end
