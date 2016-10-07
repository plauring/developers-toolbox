require 'rails_helper'

feature 'A user can add a new dev tool' do
  context 'An authenticated user can add a dev tool' do

    before do
      user2 = FactoryGirl.create(:user)
      login_as(user2, scope: :user, run_callbacks: false)
      visit new_devtool_path
    end

    let!(:devtool1) { FactoryGirl.create(:devtool) }
    let!(:devtool2) { FactoryGirl.create(:devtool) }
    scenario 'The new page has a title, body and github text area' do
      expect(page).to have_content('Title')
      expect(page).to have_content('Body')
      expect(page).to have_content('Github link')
    end

    scenario 'The user fills out the new devtool form correctly' do

      fill_in('Title', with: 'COOL GEM')
      fill_in('Body', with: 'COOL GEM BODY')
      fill_in('Github link', with: 'COOL GEM LINK')
      click_button('Add Dev Tool')

      expect(page).to have_content('COOL GEM')
      expect(page).to have_content('COOL GEM BODY')
      expect(page).to have_content('COOL GEM LINK')

    end

    scenario 'The user fills out the form incorrectly' do
      click_button('Add Dev Tool')
      expect(page).to have_content("Title can't be blank")
      expect(page).to have_content("Body can't be blank")
    end

    scenario 'The user provides non-unqiue data' do
      fill_in('Title', with: devtool1.title)
      fill_in('Body', with: devtool1.body)
      fill_in('Github link', with: devtool1.github_link)
      click_button('Add Dev Tool')

      visit new_devtool_path
      fill_in('Title', with: devtool1.title)
      fill_in('Body', with: devtool1.body)
      fill_in('Github link', with: devtool1.github_link)
      expect(page).to have_content('Title has already been taken')
      expect(page).to have_content('Body has already been taken')
      expect(page).to have_content('Github link has already been taken')
    end
  end
end
