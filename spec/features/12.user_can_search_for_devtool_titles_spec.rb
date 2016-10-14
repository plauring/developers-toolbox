require 'rails_helper'
require 'pry'

feature 'user can search for devtools from index page' do
  scenario "user visits index page and searches for a devtool" do
    devtool3 = FactoryGirl.create(:devtool)
    visit devtools_path
    fill_in 'search', with: devtool3.title
    click_button 'Search'
    expect(page).to have_content(devtool3.title)
  end

  scenario "user visits index page and searches for non-existent devtool" do
    visit devtools_path
    fill_in 'search', with: 'Happy Days'
    click_button 'Search'
    expect(page).to_not have_content('Happy Days')
  end
end
