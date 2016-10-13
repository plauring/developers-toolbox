require 'rails_helper'

feature 'user requests a change of password' do
  let!(:user2) { FactoryGirl.create(:user) }

  scenario 'authenticated user requests new password' do
    visit new_user_session_path
    click_link 'Forgot your password?'
    fill_in 'Email', with: user2.email
    click_button 'Send me reset password instructions'
    expect(page).to have_content(%{
      You will receive an email with instructions on how
      to reset your password in a few minutes.
      })
  end

  scenario 'authenticated user requests new password unsuccessfully' do
    visit new_user_session_path
    click_link 'Forgot your password?'
    fill_in('Email', with: '')
    click_button 'Send me reset password instructions'
    expect(page).to have_content("Email can't be blank")
  end
end
