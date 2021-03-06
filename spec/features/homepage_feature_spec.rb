require 'rails_helper'

feature 'Homepage' do
  context "When you arrive on the website" do
    scenario "Should display buttons for creating a new account or signing in" do
      visit '/'
      expect(page.status_code).to eq 200
      expect(page).to have_content 'Login'
      expect(page).to have_content 'Register'
      expect(page).not_to have_content "Log Today's Data"
    end
  end

  context 'When you have logged in or created a new account' do
    scenario 'Should display buttons for logging food and pain levels' do
      sign_up
      expect(page).not_to have_content 'Login'
      expect(page).not_to have_content 'Register'
      expect(page).to have_content("Log Today's Data")
      expect(page).to have_content('View Potential Trigger Foods')
      expect(page).to have_content('View Exertion/Pain Relationship')
      expect(page).to have_content('View All My Data')
    end
  end
end
