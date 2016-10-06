require 'rails_helper'
# Warden.test_mode!

feature 'A user can add a review to a Dev Tool' do
  let!(:devtool1) {FactoryGirl.create(:devtool, id: 1)}
  let!(:review1) {FactoryGirl.create(:review, devtool_id: 1)}
  context 'An authenticated user can add a review to a dev tool' do
    before {
    user2 = FactoryGirl.create(:user)
    login_as(user2, :scope => :user, :run_callbacks => false)
    visit new_devtool_review_path(devtool1.id)
    }
    scenario 'The new review page has a title, and body' do
      # binding.pry
      # save_and_open_page
      expect(page).to have_content('Title')
      expect(page).to have_content('Body')
      expect(page).to have_content('Rating')
    end

    scenario 'The user fills out the form correctly' do
      fill_in('Title', with: review1.title)
      fill_in('Body', with: review1.body)
      fill_in('Rating', with: review1.rating)
      click_button('Create Review')
      expect(page).to have_content(devtool1.title)
      expect(page).to have_content(devtool1.body)
      expect(page).to have_content(devtool1.github_link)
      expect(page).to have_content(review1.title)
      expect(page).to have_content(review1.body)
      expect(page).to have_content(review1.rating)
    end


    scenario 'The user fills out the form incorrectly' do
      fill_in('Title', with: '')
      fill_in('Body', with: '')
      fill_in('Rating', with: '')
      click_button('Create Review')
      expect(page).to have_content("Title can't be blank")
      expect(page).to have_content("Body can't be blank")
      expect(page).to have_content("Rating can't be blank")
      expect(page).to have_content('Rating is not a number')
    end
  end
  Warden.test_reset!
end