# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'User' do
  let(:companies) { create_list(:company, 3) }
  let(:user)      { create(:user) }
  let(:category)  { create(:category) }

  describe 'Signs up', type: :system do
    before do
      visit new_user_registration_path(params: { Company: companies, category: })
    end

    it 'with valid data' do
      perform_valid_data_sign_up
      expect(page).to have_error 'Confirm my account'
    end

    def perform_valid_data_sign_up
      fill_in 'user_name', with: Faker::Internet.username
      fill_in 'user_email', with: Faker::Internet.email
      fill_in 'user_password', with: '12345678'
      fill_in 'user_password_confirmation', with: '12345678'
      fill_in 'user_phone', with: '+79001234567'
      fill_in 'user_address', with: 'Moscowcity Koroleva street'
      click_button 'Sign up'
    end

    it 'with invalid data' do
      fill_in 'user_email', with: ''
      fill_in 'user_password', with: ''
      fill_in 'user_password_confirmation', with: ''
      fill_in 'user_phone', with: ''
      fill_in 'user_name', with: ''
      fill_in 'user_address', with: ''
      click_button 'Sign up'

      expect(page).to have_text 'Password is too short (minimum is 6 characters)'
      expect(page).to have_text 'Email can\'t be blank and Email is invalid'
    end
  end

  describe 'Signs in', type: :system do
    before do
      visit new_user_session_path(params: { Company: companies, category: })
    end

    it 'valid with correct credentials' do
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: user.password
      click_button 'Log in'

      expect(page).to have_link 'Log out'
    end

    it 'invalid with unregistered account' do
      fill_in 'user_email', with: Faker::Internet.email
      fill_in 'user_password', with: 'FakePassword123'
      click_button 'Log in'

      expect(page).not_to have_link 'Log out'
    end

    it 'invalid with invalid password' do
      fill_in 'user_email', with: user.email
      fill_in 'user_password', with: 'FakePassword123'
      click_button 'Log in'

      expect(page).not_to have_link 'Log out'
    end
  end

  describe 'Signs out', type: :system do
    before do
      sign_in(user)
      visit root_path(params: { Company: companies, current_user: user, category: })
    end

    it 'shows sign in link after signing out' do
      click_link 'Log out'
      expect(page).not_to have_link 'Panel'
    end
  end

  describe 'Edit', type: :system do
    before do
      sign_in(user)
      visit edit_user_registration_path(params: { Company: companies, current_user: user, category: })
    end

    it 'valid' do
      fill_in 'user_password', with: '12345678'
      fill_in 'user_current_password', with: '12345678'
      fill_in 'user_phone', with: '+79001234067'
      fill_in 'user_name', with: Faker::Internet.username
      fill_in 'user_address', with: Faker::Address.street_address
      click_button 'Update'

      expect(page).not_to have_link 'Update'
    end

    it 'invalid without correct email and password' do
      fill_in 'user_email', with: ''
      fill_in 'user_password', with: ''
      fill_in 'user_current_password', with: ''
      fill_in 'user_phone', with: ''
      fill_in 'user_name', with: ''
      fill_in 'user_address', with: ''
      click_button 'Update'

      expect(page).to have_text 'Password is too short (minimum is 6 characters) and Password can\'t be blank'
      expect(page).to have_text 'Current password can\'t be blank'
      expect(page).to have_text 'Email can\'t be blank and Email is invalid'
    end

    it 'invalid with correct email and password' do
      fill_in 'user_password', with: '12345678'
      fill_in 'user_current_password', with: '12345678'
      fill_in 'user_phone', with: ''
      fill_in 'user_name', with: ''
      fill_in 'user_address', with: ''
      click_button 'Update'

      expect(page).not_to have_text 'Password is too short (minimum is 6 characters) and Password can\'t be blank'
      expect(page).not_to have_text 'Current password can\'t be blank'
      expect(page).not_to have_text 'Email can\'t be blank and Email is invalid'
      expect(page).to have_text 'Phone is too short (minimum is 11 characters)'
      expect(page).to have_text 'Name is too short (minimum is 3 characters)'
    end
  end
end
