require 'rails_helper'

feature 'user signs up', %Q{
  As an unauthenticated user
  I want to sign up
  So that I can create Dev Tools for review and write reviews on Dev Tools
} do

  scenario 'specify valid and required information' do
    visit root_path
    click_link 'Sign Up'
    fill_in "Username", with: "Partyboy5000"
    fill_in "Email", with: "Partyboy5000@examply.com"
    fill_in "user_password", with: "party4life"
    fill_in 'Password Confirmation', with: 'party4life'
    click_button 'Sign Up'

    expect(page).to have_content("Sign up successful!")
    expect(page).to have_content("Sign Out")
  end

  scenario 'required information is not supplied' do
    visit root_path
    click_link 'Sign Up'
    click_button 'Sign Up'

    expect(page).to have_content("can't be blank")
    expect(page).to have_content("Sign Out")
  end

  scenario 'password confirmation does not match confirmation' do
    visit root_path
    click_link 'Sign Up'

    fill_in 'user_password', with: 'password'
    fill_in 'Passord Confirmation', with: 'somethingdifferent'

    click_button 'Sign Up'

    expect(page).to have_content("doesn't match")
    expect(page).to have_content("Sign Out")
  end
end
