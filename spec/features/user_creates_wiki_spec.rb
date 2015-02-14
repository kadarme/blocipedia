require 'rails_helper'

feature 'User creates wiki' do
  scenario 'Successfully' do
    user = create(:user)
    visit root_path
    within '.user-info' do
     click_link 'Sign In'
    end
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    within 'form' do
     click_button 'Sign in'
    end
    
    wiki = create(:wiki)
    visit new_wiki_path
    fill_in 'Enter wiki title', with: wiki.title 
    fill_in 'Enter wiki body', with: wiki.body
    click_on 'Save'
    expect(page).to have_content('Wiki was saved.')
    
  end
end