require 'rails_helper'

feature 'App opens to welcome page' do
  scenario 'Successfully' do
    visit root_path
    expect(page).to have_content('Home About Wikis Sign In or Sign Up')
  end
end
  