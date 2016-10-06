require 'rails_helper'

feature 'A user can see vote buttons on reviews' do
let!(:devtool1) {FactoryGirl.create(:devtool, id: 1)}
let!(:review) {FactoryGirl.create(:review, devtool: devtool1)}

  context 'An authenticated user can click the buttons' do
    let!(:user) {User.create(name: "partybody200", email:"2hard2party@example.com", password:"123qwe")}
    before { visit devtool_path(devtool1.id) }
    
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

    context 'More users click up/down vote' do
      let!(:user) {User.create(name: "partybody200", email:"2hard2party@example.com", password:"123qwe")}
      let!(:user1) {User.create(name: "partybody2001", email:"2hard2party@example.com1", password:"123qwe1")}

      scenario 'Two users vote up' do
        click_button('upvote')
        visit devtool_path(devtool1.id)
        expect(page).to have_content("2 upvote")
        expect(page).to have_content("sum of votes: 2")
      end

      scenario 'Two users vote down' do
        click_button('downvote')
        visit devtool_path(devtool1.id)
        expect(page).to have_content("2 downvote")
        expect(page).to have_content("sum of votes: -2")
      end
    end
  end
end
