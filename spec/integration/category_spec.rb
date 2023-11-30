require 'rails_helper'

RSpec.describe 'Category', type: :feature do
  before(:each) do
    @user = User.create(name: 'tom', email: 'tom@example.com', password: '1234567890',
                        password_confirmation: '1234567890')
    @category = Category.create(name: 'Cloth', icon: 'cloth.jpg')

    visit new_user_session_path
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Log in'
  end

  describe 'Test for category' do
    it 'create a new category' do
        visit categories_path
      click_on 'Add New Category'
      fill_in 'Name', with: 'Shoe'
      fill_in 'icon', with: 'shoe.jpg'
      click_button 'Create Category'
      expect(page).to have_text('Shoe')
    end

    it 'page should contain icon' do
        visit categories_path
        expect(page).to have_css("img[src*='cloth.jpg']")
    end

    it 'navigates to the specific category upon clicking' do
      visit categories_path
      click_on 'Cloth'
      expect(current_path).to match(category_path(@category.id))
    end
  end
end
