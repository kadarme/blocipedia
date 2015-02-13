require 'rails_helper'

feature 'User signs up for Blocipedia' do
  scenario 'Successfully' do
    visit new_user_registration_path
    fill_in 'Name', with: 'Mickey Mouse'
    fill_in 'Email', with: 'user@example.com'
    fill_in 'Password', with: 'helloworld'
    fill_in 'Password confirmation', with: 'helloworld'
    click_button 'Sign up'
    expect(page).to have_content('A message with a confirmation link has been sent to your email address. Please follow the link to activate your account.')
  end
end
