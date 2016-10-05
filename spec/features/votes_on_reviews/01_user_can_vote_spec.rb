require 'rails_helper'

feature 'A user can see vote buttons on reviews' do
let!(:user) {User.create(name: "partybody200", email:"2hard2party@example.com", password:"123qwe" )}
let!(:devtool1) {FactoryGirl.create(:devtool, id: 1)}
let!(:review) {FactoryGirl.create(:review, devtool: devtool1)}
  context 'An authenticated user can click the buttons' do
    before { visit devtool_path(devtool1.id) }
    scenario 'The user clicks upvote' do
      # click_button('upvote')
        if Vote.find_by(user_id: user.id, review_id: review.id).nil?
          Vote.create(user_id: user.id, review_id: review.id, status: true)
        else
          if vote.status == true
            Vote.destroy
          else
            Vote.status = true
          end
        end
      expect
    end
    scenario 'The user clicks downvote' do
      click_button("downvote")
      downvote_minus = downvote_count - 1
      expect(page).to have_content(downvote_minus)
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
