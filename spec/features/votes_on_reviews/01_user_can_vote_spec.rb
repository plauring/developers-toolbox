require 'rails_helper'

feature 'A user can see vote buttons on reviews' do
let!(:user) {User.create(name: "partybody200", email:"2hard2party@example.com", password:"123qwe")}
let!(:user1) {User.create(name: "partybody2001", email:"2hard2party@example.com1", password:"123qwe1")}
let!(:user2) {User.create(name: "partybody2002", email:"2hard2party@example.com2", password:"123qwe2")}

let!(:devtool1) {FactoryGirl.create(:devtool, id: 1)}
let!(:review) {FactoryGirl.create(:review, devtool: devtool1)}
  context 'An authenticated user can click the buttons' do
    before { visit devtool_path(devtool1.id) }
    scenario 'The user clicks upvote' do
      click_button('upvote')
      visit devtool_path(devtool1.id)
          save_and_open_page
      expect(page).to have_content("3 upvote")

      click_button('upvote')
      visit devtool_path(devtool1.id)
      expect(page).to have_content("")
    end
    scenario 'The user clicks downvote' do
      click_button("downvote")
      visit devtool_path(devtool1.id)
      expect(page).to have_content("3 downvote")
    end
    scenario 'The user clicks upvote a second time' do
      # foo
    end
    scenario 'The user clicks downvote a second time' do
      # foo
    end
    scenario 'User changes their vote' do
      # foo
    end
  end
end
