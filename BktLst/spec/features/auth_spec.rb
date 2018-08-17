require 'spec_helper'
require 'rails_helper'

# before(:each) do
#   visit new_user_url

feature 'the signup process' do
  scenario 'has a new user page' do
  visit new_user_url
    expect(page).to have_content("Hello New User!")
  end

  feature 'signing up a user' do
    scenario 'shows username on the homepage after signup' do
      visit new_user_url
      fill_in "Name", with: 'Homer'
      fill_in 'Username', with: 'simpson'
      fill_in 'Password', with: 'biscuits'
      click_on 'Sign Up!'
    end
  end
end

feature 'logging in' do
  scenario 'shows username on the homepage after login'

end

feature 'logging out' do
  scenario 'begins with a logged out state'

  scenario 'doesn\'t show username on the homepage after logout'

end
