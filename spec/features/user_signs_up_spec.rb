require 'rails_helper'

feature 'User signs up for Blocipedia' do
 
  before do
    @user = create(:user)
  end
  
  scenario 'Successfully' do
    visit signup_path
    print page.html
    fill_in 'Name:', with: 'Mickey Mouse'
    fill_in 'Email:', with: 'user@example.com'
    fill_in 'Password:', with: 'password'
    fill_in 'Password Confirmation:', with: 'password'
    click_button 'Sign Up'
    expect(page).to have_content('Mickey Mouse')
    expect(page).to have_content('Log Out')
  end
  
end
 