require 'rails_helper'

feature 'View one dev tool on a unique show page' do
  context 'A guest can view a dev tool' do
    before { visit devtool_path(devtool.id) }
    scenario "A dev tool and it's reviews are seen on a unique page"do
      expect(page).to have_content(devtool.title)
      expect(page).to have_content(devtool.body)
      expect(page).to have_content(review.title)
      expect(page).to have_content(review.body)
      expect(page).to not_have_content("New Review")
    end
  end



end
