require 'rails_helper'

feature "views a list of all items" do
  let!(:dev_tools) {FactoryGirl.create_list(:dev_tool, 5 )}
  context "as a guest" do
    before { visit dev_tools_path }
    scenario "guest sees all the development tools" do
      dev_tools.each do |dev_tool|
        expect(page).to have_content(dev_tool.title)
      end
    end

    # scenario "guest only has guest privilages" do
    #  expect(page).to not_have_content('Add a dev_tool')
    #  expect(page).to not_have_content('delete button')
    #  expect(page).to have_content('Sign Up Button')
    # end      
  end
end
