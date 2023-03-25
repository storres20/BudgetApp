require 'rails_helper'

RSpec.describe 'Splash Page', type: :system do
  describe 'Splash /index' do
    before :each do
      visit root_path
    end

    it 'displays valid welcome text' do
      expect(page).to have_content('Budget App')
    end

    it 'displays a button with text Log in' do
      expect(page).to have_content('LOG IN')
    end

    it 'button redirects to log in form' do
      click_link 'LOG IN'
      expect(page).to have_current_path new_user_session_path
    end

    it 'displays a button with text Log in' do
      expect(page).to have_content('SIGN UP')
    end

    it 'button redirects to log in form' do
      click_link 'SIGN UP'
      expect(page).to have_current_path new_user_registration_path
    end
  end
end
