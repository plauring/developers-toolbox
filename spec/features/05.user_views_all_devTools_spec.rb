require 'rails_helper'

feature 'views a list of all items' do
  let!(:devtool1) { FactoryGirl.create(:devtool) }
  let!(:devtool2) { FactoryGirl.create(:devtool) }
  let!(:devtool3) { FactoryGirl.create(:devtool) }
  let!(:devtool4) { FactoryGirl.create(:devtool) }
  context 'as a guest' do
    before { visit devtools_path }
    scenario 'guest sees all the development tools' do
      expect(page).to have_content(devtool1.title)
      expect(page).to have_content(devtool2.title)
      expect(page).to have_content(devtool3.title)
      expect(page).to have_content(devtool4.title)
    end
  end
end
