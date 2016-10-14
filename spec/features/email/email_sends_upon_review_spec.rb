require 'rails_helper'

feature 'email to Dev Tool page creator' do
  scenario 'user reviews a dev tool' do
    user = FactoryGirl.create(:user)
    devtool = FactoryGirl.create(:devtool, user_id: user.id)

    login_as(user, scope: :user, run_callbacks: false)

    visit new_devtool_review_path(devtool)
    fill_in 'Title', with: 'Factory Girl'
    fill_in 'Rating', with: '5'
    fill_in 'Body', with: 'This development tool is most dope'
    click_button 'Create Review'
    expect(page).to have_content('This development tool is most dope')
    expect(ActionMailer::Base.deliveries.count).to eq(1)
  end
end
