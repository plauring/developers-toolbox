require 'rails_helper'
require 'pry'

feature 'View one dev tool on a unique show page' do
  context 'A guest can view a dev tool' do
    before do
      devtool1 = FactoryGirl.create(:devtool, id: 1)
      review1 = FactoryGirl.create(:review, devtool: devtool1)
      review2 = FactoryGirl.create(:review, devtool: devtool1)
      visit devtool_path(devtool1.id)
    end
    scenario "A dev tool and it's average rating is seen on a unique page" do
      @average_rating = (review1.rating + review2.rating)/2
      expect(page).to have_content('Average Rating')
      expect(page).to have_content(@average_rating)
    end
  end
end
