require 'rails_helper'
require 'pry'

feature 'View one dev tool and its rating on a unique show page' do
  scenario "A dev tool and it's average rating is seen on a unique page" do
    devtool1 = FactoryGirl.create(:devtool, id: 1)
    review1 = FactoryGirl.create(:review, devtool: devtool1)
    review2 = FactoryGirl.create(:review, devtool: devtool1)
    visit devtool_path(devtool1.id)
    @average_rating = (review1.rating + review2.rating) / 2
    expect(page).to have_content('Average Rating')
    expect(page).to have_content(@average_rating)
  end
end
