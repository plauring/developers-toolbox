require 'rails_helper'

feature 'View one dev tool on a unique show page' do
  let!(:devtool1) {FactoryGirl.create_list(:devtool)}
  let!(:review1) {FactoryGirl.create_list(:review)}
  let!(:review2) {FactoryGirl.create_list(:review, devtool_id: 2)}
  context 'A guest can view a dev tool' do
    before { visit devtool_path(devtool.id) }
    scenario "A dev tool and it's reviews are seen on a unique page"do
      devtool = devtool1
      review1.devtool_id = devtool1.id
      expect(page).to have_content(devtool.title)
      expect(page).to have_content(devtool.body)
      expect(page).to have_content(review1.title)
      expect(page).to have_content(review1.body)
      expect(page).to not_have_content(review2.title)
      expect(page).to not_have_content(review2.body)
      expect(page).to not_have_content("New Review")
    end
  end



end
