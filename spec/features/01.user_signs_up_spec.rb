require 'rails_helper'

feature 'user signs up', %(
  As an unauthenticated user
  I want to sign up
  So that I can create Dev Tools for review and write reviews on Dev Tools
) do

  scenario 'specify valid and required information' do
    logout(:user)
    visit root_path
    click_link 'Sign Up'
    fill_in "Username", with: "Partyboy5000"
    fill_in "Email", with: "Partyboy5000@example.com"
    fill_in "user_password", with: "party4life"
    fill_in 'Password Confirmation', with: 'party4life'
    click_button 'Sign Up'
    expect(page).to have_content("Welcome! You have signed up successfully.")
    expect(page).to have_content("Sign Out")
  end

  scenario 'required information is not supplied' do
    visit root_path
    click_link 'Sign Up'
    click_button 'Sign Up'

    expect(page).to have_content("can't be blank")
    expect(page).to_not have_content("Sign Out")
  end

  scenario 'password confirmation does not match confirmation' do
    visit root_path
    click_link 'Sign Up'

    fill_in 'Password', with: 'password'
    fill_in 'Password Confirmation', with: 'somethingdifferent'

    click_button 'Sign Up'

    expect(page).to have_content("doesn't match")
    expect(page).to_not have_content("Sign Out")
  end
end
