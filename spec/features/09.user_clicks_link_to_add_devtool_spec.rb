require 'rails_helper'

feature 'user click on add devtool' do
  context 'As and authenticated user' do
    before do
      user2 = FactoryGirl.create(:user)
      login_as(user2, scope: :user, run_callbacks: false)
      visit root_path
    end
    scenario 'I can click the link and be taken to the create page' do
      click_link 'Add New Dev Tool'

      expect(page).to have_content('Add A Dev Tool')
      expect(page).to have_content('Title')
      expect(page).to have_content('Body')
      expect(page).to have_content('Github link')
    end
  end
  context 'As an unauthenticated user' do
    scenario 'I can click the link, but it will only give me an error' do
      visit root_path
      click_link 'Add New Dev Tool'

      expect(page).to have_content('Add New Dev Tool')
      expect(page).to have_content('Sign In or Sign Up to add a Dev tool for review.')
    end
  end
end
