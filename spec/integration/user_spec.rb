require 'rails_helper'

RSpec.describe 'User', type: :feature do
  before(:each) do
    @user = User.create(name: 'Tom', email: 'tom@example.com', password: '123456',
                        password_confirmation: '123456')
  end

  describe 'sign in page' do

    it 'have a form for signing in' do
      visit new_user_session_path
      expect(page).to have_field('Email', placeholder: 'Email')
      expect(page).to have_field('Password', placeholder: 'Password')
    end

    it 'log in with credentials' do
      visit new_user_session_path
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      click_button 'Log in'
      expect(current_path).to match('/')
    end

    it 'have a sign up link' do
      visit new_user_session_path
      expect(page).to have_content('Sign up')
    end

    it 'have a forgot password link' do
      visit new_user_session_path
      expect(page).to have_content('Forgot your password')
    end

    it 'log in with credentials' do
      visit new_user_session_path
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password
      click_button 'Log in'
      expect(current_path).to match('/')
    end

    it 'redirect to forgot password page' do
      visit new_user_session_path
      click_link 'Forgot your password?'
      expect(current_path).to match(new_user_password_path)
    end

    it 'have form text' do
      visit new_user_session_path
      expect(page).to have_content('Remember me')
    end

    it 'show content for forgot password page' do
      visit new_user_password_path
      expect(page).to have_content('Forgot your password')
      expect(page).to have_content('Email')
      expect(page).to have_button('Send me reset password instructions')
      expect(page).to have_content('Log in')
      expect(page).to have_content('Sign up')
    end
  end
end
