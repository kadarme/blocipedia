require 'rails_helper'

feature 'User email errors where' do
  
  scenario 'user signs up with invalid email' do
    visit new_user_registration_path
    fill_in 'Name', with: 'Mickey Mouse'
    fill_in 'Email', with: 'notrealemail.com'
    fill_in 'Password', with: 'helloworld'
    fill_in 'Password confirmation', with: 'helloworld'
    click_button 'Sign up'
    expect(current_path).to eq user_registration_path
  end
  
  scenario 'user signs up with duplicate email' do
    visit new_user_registration_path
    fill_in 'Name', with: 'Mickey Mouse'
    fill_in 'Email', with: 'admin@example.com'
    fill_in 'Password', with: 'helloworld'
    fill_in 'Password confirmation', with: 'helloworld'
    click_button 'Sign up'
    expect(current_path).to eq root_path
  end
  
end