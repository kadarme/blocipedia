require 'rails_helper'

feature  'User upgrades to premium account' do
  scenario 'Successfully' do
  StripeMock.start_client
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
  
    visit wikis_path
    click_on 'Upgrade to premium account'
    click_on 'Pay with Card'
    fill_in 'Email', with: user.email
    fill_in 'Card Number', with: '371449635398431'
    fill_in 'MM/YY', with: '05/15'
    fill_in 'CVC', with: '123'
    click_button 'Pay $15.00'
  
    expect(page).to have_content("Thanks, you paid $15.00!")
  
  StripeMock.stop_client
  end
end
