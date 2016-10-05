require 'rails_helper'

feature "user requests a change of password" do
  before(:each) do
    visit root_path
    click_link 'Sign Up'
    fill_in 'Username', with: 'Partyboy5000'
    fill_in 'Email', with: 'Partyboy5000@example.com'
    fill_in "user_password", with: 'party4life'
    fill_in 'Password Confirmation', with: 'party4life'
    click_button 'Sign Up'
    click_link 'Sign Out'
  end
  scenario "authenticated user requests new password" do
    visit new_user_session_path
    click_link "Forgot your password?"
    fill_in("Email", with: 'Partyboy5000@example.com')
    click_button "Send me reset password instructions"
    expect(page).to have_content("You will receive an email with instructions on how to reset your password in a few minutes.")
  end

  scenario "authenticated user requests new password unsuccessfully" do
    visit new_user_session_path
    click_link "Forgot your password?"
    fill_in("Email", with: '')
    click_button "Send me reset password instructions"
    expect(page).to have_content("Email can't be blank")
  end
end
