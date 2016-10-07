require 'rails_helper'

feature 'views a list of all items' do
  let!(:devtools) { FactoryGirl.create_list(:devtool, 5 ) }
  context 'as a guest' do
    before { visit devtools_path }
    scenario 'guest sees all the development tools' do
      devtools.each do |devtool|
        expect(page).to have_content(devtool.title)
      end
    end
  end
end
