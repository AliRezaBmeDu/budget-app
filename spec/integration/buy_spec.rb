require 'rails_helper'

RSpec.describe 'Transactions', type: :feature do
  before(:each) do
    @user = User.create(name: 'tom', email: 'tom@example.com', password: '1234567890',
                        password_confirmation: '1234567890')
    @category = Category.create(name: 'Cloth', icon: 'cloth.jpg', user_id: @user.id)
    @amount1 = 10.50
    @amount2 = 7.80
    @buy1 = Buy.create(name: 'Pants', amount: @amount1, category_ids: [@category.id], author_id: @user.id)
    @buy2 = Buy.create(name: 'Shirt', amount: @amount2, category_ids: [@category.id], author_id: @user.id)
    visit new_user_session_path
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_button 'Log in'
  end

  describe 'Test for Transactions' do
    it 'shows the total amount' do
      visit category_path(@category.id)
      expect(page).to have_text("$ #{@amount1 + @amount2}")
    end

    it 'navigates to new transaction page' do
      visit category_path(@category.id)
      click_on 'Add New Transaction'
      expect(page).to have_field('Name', placeholder: 'Name')
      expect(page).to have_field('Amount', placeholder: 'Amount')
    end

    it 'creates a new transaction' do
      visit category_path(@category.id)
      click_on 'Add New Transaction'
      fill_in 'Name', with: 'New Transaction'
      fill_in 'Amount', with: 20.50
      
      find(".form-check-input", match: :first).click

      click_button 'Save Transaction'

      expect(page).to have_text('New Transaction')
    end

    it 'navigates to the homepage upon clicking back button' do
      visit category_path(@category.id)
      find('nav a i.bi-arrow-left').click
      expect(current_path).to match('/')
    end
  end
end
