require 'rails_helper'
require 'pry'

feature 'View one dev tool on a unique show page' do
  let!(:devtool1) {FactoryGirl.create(:devtool, id: 1)}
  let!(:review1) {FactoryGirl.create(:review, devtool_id: 1)}
  let!(:devtool2) {FactoryGirl.create(:devtool, id: 2)}
  let!(:review2) {FactoryGirl.create(:review, devtool_id: 2)}
  context 'A guest can view a dev tool' do
    before { visit devtool_path(devtool1.id) }
    scenario "A dev tool and it's reviews are seen on a unique page"do
      devtool = devtool1
      expect(page).to have_content(devtool.title)
      expect(page).to have_content(devtool.body)
      expect(page).to have_content(review1.title)
      expect(page).to have_content(review1.body)
      expect(page).to_not have_content(review2.title)
      expect(page).to_not have_content(review2.body)
      # expect(page).to_not have_content("New Review") need user authorization setting
    end
  end
end
