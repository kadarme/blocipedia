require 'rails_helper'

feature 'User signs in and out' do
  
  
  scenario 'User signs in successfully' do
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
    
    expect(page).to have_content('Signed in successfully.')
  end
  
  scenario 'User signs out successfully' do
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
    
    within '.user-info' do
     click_link 'Sign Out'
    end
    
    expect(page).to have_content('Signed out successfully.')
  end
end
  