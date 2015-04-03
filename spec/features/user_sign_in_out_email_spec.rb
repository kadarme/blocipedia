require 'rails_helper'

feature 'User email errors where' do
  
  scenario 'User signs in with invalid email' do
    user = create(:user)
    visit root_path

    within '.user-info' do
     click_link 'Sign In'
    end
    
    fill_in 'Email', with: "notrealemail.com"
    fill_in 'Password', with: user.password
    
    within 'form' do
     click_button 'Sign in'
    end
    
    expect(current_path).to have_content user_session_path
  end
  
  scenario 'User signs in with duplicate email' do
    user = create(:user)
    visit root_path

    within '.user-info' do
     click_link 'Sign In'
    end
    
    fill_in 'Email', with: user.email
    fill_in 'Password', with: "not match"
    
    within 'form' do
     click_button 'Sign in'
    end
    
    expect(current_path).to have_content user_session_path
  end
  
  scenario 'User forgot password' do
    user = create(:user)  
    visit root_path

    within '.user-info' do
     click_link 'Sign In'
    end
    
    within 'form' do
      click_link 'Forgot your password?'
    end
    
    fill_in 'Email', with: user.email
    within 'form' do
      click_button 'Send me reset password instructions'
    end
    
    expect(current_path).to have_content user_session_path
  end
 
  scenario 'user leaves blank email' do
    user = create(:user)  
    visit root_path

    within '.user-info' do
     click_link 'Sign In'
    end
    
    within 'form' do
      click_link 'Forgot your password?'
    end

    fill_in 'Email', with: ("")
    within 'form' do      
      click_button 'Send me reset password instructions'
    end

    expect(current_path).to eq user_password_path
  end
end
    