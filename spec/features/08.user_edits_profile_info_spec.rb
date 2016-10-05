require 'rails_helper'

feature 'authenticated user edits profile information' do
  before(:each) do
    visit root_path
    click_link 'Sign Up'
    fill_in 'Username', with: 'Partyboy5000'
    fill_in 'Email', with: 'Partyboy5000@example.com'
    fill_in 'user_password', with: 'party4life'
    fill_in 'Password Confirmation', with: 'party4life'
    click_button 'Sign Up'
  end

  scenario 'visits profile page and edits email' do
    click_link 'Your Profile'
    expect(page).to have_content('Partyboy5000')
    expect(page).to have_content('partyboy5000@example.com')

    click_link 'Edit your profile'
    fill_in 'Email', with: 'Partygirl5000@example.com'
    fill_in 'user_password', with: 'party4life'
    fill_in 'Password confirmation', with: 'party4life'
    fill_in 'Current password', with: 'party4life'
    click_button 'Update'
    expect(page).to have_content('Your account has been updated successfully')
  end
end
