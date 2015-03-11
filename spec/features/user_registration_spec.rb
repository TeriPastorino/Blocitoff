require 'rails_helper'

describe "signup page" do
  it "should have the content 'Sign up'" do
    visit new_user_registration_path
    expect(page).to have_content('Sign up')
  end
end

#trying to figure out how to set up data and how to test for confirmation
  describe "user registration" do
    
    it "new user signs up and receives confirmation" do
      visit new_user_registration_path

      fill_in 'Username', with: 'tpasto'
      fill_in 'Email', with: 'tpasto@comcast.net'
      fill_in 'Password', with: 'password'

      expect(page).to have_content
      #click_button 'Sign up'
    end
  end

#
describe "valid email" do
  it "checks valid email address" do
      fill_in 'Email', with: 'user@example.com'
      fill_in 'Password', with: 'password'
    end
    #click_button 'Log in'
  end

describe "unique email address" do
end

