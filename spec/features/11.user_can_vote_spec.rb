require 'rails_helper'

feature 'A user can upvote and downvote buttons reviews' do
  let!(:devtool1) {FactoryGirl.create(:devtool, id: 1)}
  let!(:review1) {FactoryGirl.create(:review, devtool: devtool1)}

  context 'An authenticated user can click the buttons' do
    before  do
      user1 = FactoryGirl.create(:user)
      login_as(user1)
      # binding.pry
      visit devtool_path(devtool1.id)
    end

    scenario 'The user clicks upvote' do
      click_button('upvote')
      visit devtool_path(devtool1.id)
      expect(page).to have_content("1 upvote")
      expect(page).to have_content("sum of votes: 1")
      click_button('upvote')
      visit devtool_path(devtool1.id)
      expect(page).to have_content("0 upvote")
      expect(page).to have_content("sum of votes: 0")
    end

    scenario 'The user clicks downvote' do
      click_button("downvote")
      visit devtool_path(devtool1.id)
      expect(page).to have_content("1 downvote")
      expect(page).to have_content("sum of votes: -1")
      click_button("downvote")
      visit devtool_path(devtool1.id)
      expect(page).to have_content("0 downvote")
      expect(page).to have_content("sum of votes: 0")
    end

    scenario 'The user clicks downvote then upvote' do
      click_button("downvote")
      visit devtool_path(devtool1.id)
      expect(page).to have_content("1 downvote")
      expect(page).to have_content("sum of votes: -1")
      click_button("upvote")
      visit devtool_path(devtool1.id)
      expect(page).to have_content("1 upvote")
      expect(page).to have_content("sum of votes: 1")
    end

    scenario 'The user clicks upvote then downvote' do
      click_button("upvote")
      visit devtool_path(devtool1.id)
      expect(page).to have_content("1 upvote")
      expect(page).to have_content("sum of votes: 1")
      click_button("downvote")
      visit devtool_path(devtool1.id)
      expect(page).to have_content("1 downvote")
      expect(page).to have_content("sum of votes: -1")
    end
  end

  context "multiple users log in and vote" do
    scenario 'Two different users vote up' do
      user2 = FactoryGirl.create(:user)
      user3 = FactoryGirl.create(:user)
      login_as(user2)
      visit devtool_path(devtool1.id)
      click_button('upvote')
      logout(:user)
      login_as(user3)
      click_button('upvote')
      expect(page).to have_content("2 upvote")
      expect(page).to have_content("sum of votes: 2")
    end

    scenario 'Two different users vote down' do
      user2 = FactoryGirl.create(:user)
      user3 = FactoryGirl.create(:user)
      login_as(user2)
      visit devtool_path(devtool1.id)
      click_button('downvote')
      logout(:user)
      login_as(user3)
      click_button('downvote')
      visit devtool_path(devtool1.id)
      expect(page).to have_content("2 downvote")
      expect(page).to have_content("sum of votes: -2")
    end
  end
end
