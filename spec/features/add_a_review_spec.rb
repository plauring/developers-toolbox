require 'rails_helper'

feature 'A user can add a review to a Dev Tool' do
  context 'An authenticated user can add a review to a dev tool' do
    before { visit new_devtool_review_path }
    scenario 'The new review page has a title, and body' do
      expect(page).to have_content("Review Title")
      expect(page).to have_content("Review Body")
    end
    scenario 'The user fills out the form incorrectly' do
      expect(page).to have_content("There is no title")
      expect(page).to have_content("There is no body")
    end
  end
end
