require 'rails_helper'

feature 'Users can upvote and downvote buttons reviews' do
  let!(:devtool1) {FactoryGirl.create(:devtool, id: 1)}
  let!(:review1) {FactoryGirl.create(:review, devtool: devtool1)}

  context 'An authenticated user can click the buttons' do
    scenario 'The user clicks upvote' do
      user1 = FactoryGirl.create(:user)
      login_as(user1)
      visit devtool_path(devtool1.id)
      Vote.create(user_id: user1.id, review_id: review1.id, status: true)
      visit devtool_path(devtool1.id)
      expect(page).to have_content("1 upvote")
      expect(page).to have_content("sum of votes: 1")
      Vote.find_by(user_id: user1.id, review_id: review1.id, status: true).destroy
      visit devtool_path(devtool1.id)
      expect(page).to have_content("0 upvote")
      expect(page).to have_content("sum of votes: 0")
    end

    scenario 'The user clicks downvote' do
      user1 = FactoryGirl.create(:user)
      login_as(user1)
      visit devtool_path(devtool1.id)
      Vote.create(user_id: user1.id, review_id: review1.id, status: false)
      click_button("downvote")
      visit devtool_path(devtool1.id)
      expect(page).to have_content("1 downvote")
      expect(page).to have_content("sum of votes: -1")
      Vote.find_by(user_id: user1.id, review_id: review1.id, status: false).destroy
      visit devtool_path(devtool1.id)
      expect(page).to have_content("0 downvote")
      expect(page).to have_content("sum of votes: 0")
    end

    scenario 'The user clicks downvote then upvote' do
      user1 = FactoryGirl.create(:user)
      login_as(user1)
      visit devtool_path(devtool1.id)
      Vote.create(user_id: user1.id, review_id: review1.id, status: false)
      visit devtool_path(devtool1.id)
      expect(page).to have_content("1 downvote")
      expect(page).to have_content("sum of votes: -1")
      Vote.find_by(user_id: user1.id, review_id: review1.id, status: false).update(status: true)
      visit devtool_path(devtool1.id)
      expect(page).to have_content("1 upvote")
      expect(page).to have_content("sum of votes: 1")
    end

    scenario 'The user clicks upvote then downvote' do
      user1 = FactoryGirl.create(:user)
      login_as(user1)
      visit devtool_path(devtool1.id)
      Vote.create(user_id: user1.id, review_id: review1.id, status: true)
      visit devtool_path(devtool1.id)
      expect(page).to have_content("1 upvote")
      expect(page).to have_content("sum of votes: 1")
      Vote.find_by(user_id: user1.id, review_id: review1.id, status: true).update(status: false)
      visit devtool_path(devtool1.id)
      expect(page).to have_content("1 downvote")
      expect(page).to have_content("sum of votes: -1")
    end

    scenario 'Two different users vote down' do
      user2 = FactoryGirl.create(:user)
      user3 = FactoryGirl.create(:user)
      login_as(user2)
      visit devtool_path(devtool1.id)
      Vote.create(user_id: user2.id, review_id: review1.id, status: false)
      logout(:user)
      login_as(user3)
      Vote.create(user_id: user3.id, review_id: review1.id, status: false)
      visit devtool_path(devtool1.id)
      expect(page).to have_content("2 downvote")
      expect(page).to have_content("sum of votes: -2")
    end

    scenario 'Two different users vote up' do
      user2 = FactoryGirl.create(:user)
      user3 = FactoryGirl.create(:user)
      login_as(user2)
      visit devtool_path(devtool1.id)
      Vote.create(user_id: user2.id, review_id: review1.id, status: true)
      logout(:user)
      login_as(user3)
      Vote.create(user_id: user3.id, review_id: review1.id, status: true)
      visit devtool_path(devtool1.id)
      expect(page).to have_content("2 upvote")
      expect(page).to have_content("sum of votes: 2")
    end

  end
end
