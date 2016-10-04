require 'rails_helper'

feature 'A user can add a new dev tool' do
  context 'An authenticated user can add a dev tool' do
    before { visit new_devtool_path }
    scenario 'The new page has a title, body and github text area' do
      expect(page).to have_content("Dev Tool Title")
      expect(page).to have_content("Dev Tool Body")
      expect(page).to have_content("Dev Tool github link")
    end
    scenario 'The user fills out the form incorrectly' do
      expect(page).to have_content("There is no title")
      expect(page).to have_content("There is no body")
      expect(page).to have_content("There is already a dev tool with this title")
      expect(page).to have_content("There is already a dev tool that has this description")
      expect(page).to have_content("There is already a dev tool with this github link")
    end
  end
end
