require 'rails_helper'
require 'pry'

# COMMENTED OUT BECAUSE THIS FEATURE IS ON ANOTHER BRANCH
# feature 'user can search for devtools from index page' do
#   scenario "user visits index page and searches for a devtool" do
#     devtool3 = FactoryGirl.create(:devtool)
#     devtool4 = FactoryGirl.create(:devtool)
#     visit devtools_path
#     fill_in 'Search', with: devtool3.title
#     expect(page).to have_content(devtool3.title)
#     expect(page).to_not have_content(devtool4.title)
#   end
#
#   scenario "user visits index page and searches for non-existent devtool" do
#     devtool3 = FactoryGirl.create(:devtool)
#     devtool4 = FactoryGirl.create(:devtool)
#     visit devtools_path
#     fill_in 'Search', with: 'Happy Days'
#     expect(page).to_not have_content(devtool3.title)
#     expect(page).to_not have_content(devtool4.title)
#   end
# end
# COMMENTED OUT BECAUSE THIS FEATURE IS ON ANOTHER BRANCH
