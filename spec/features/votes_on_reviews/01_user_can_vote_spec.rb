require 'rails_helper'

feature 'A user can see vote buttons on reviews' do
  context 'An authenticated user can click the buttons' do
    before { visit devtool_path(devtool.id) }
    scenario 'The user clicks upvote' do
      click_button("upvote")
      upvote_plus = upvote_count + 1
      expect(page).to have_content(upvote_plus)
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
