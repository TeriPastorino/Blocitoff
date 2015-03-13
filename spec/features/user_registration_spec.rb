require 'rails_helper'

#include TestFactories

def signup(username, email, password)
  visit new_user_registration_path
  fill_in 'Username', with: username
  fill_in 'Email', with: email
  fill_in 'Password', with: password
  fill_in 'Password confirmation', with: password
  click_button 'Sign up'
end

describe "User registration" do
  describe "Without validation errors" do
    it "should have the content 'Sign up'" do
      visit new_user_registration_path
      expect(page).to have_content('Sign up')
    end
  end

  it "redirects to the index page" do
    signup('newuser', 'newuser@example.com', 'password')
    expect(current_path).to eq "/"
    expect(page).to have_content('activate')
  end  
end


describe "confirm user" do
  it "sends a confirmation email" do
    let(:current_email) {ActionMailer::Base.deliveries.last}
    # This is what let does for us
    # def current_email
    #   # memoize the response
    #   @current_email ||= ActionMariler::Base.delveries.last
    # end
    signup('newuser', 'newuser@example.com', 'password')
    expect(page).to have_content("activate your account")
    expect(current_email.to.first).to eq('newuser@example.com')
  end
end
  
describe "without filling in an email" do
  it "displays 'Email can't be blank'" do
    signup('newuser', '', 'password')
    expect(page).to have_content("Email can't be blank")
  end
end


describe "using an already existing email" do
  it "displays 'Email is already taken'" do
    #before do
    create(:user, email: "existing@example.com")
  
    signup('newuser','existin@example.com','password')
    expect(page).to have_content("that email is already taken")
  end
end

def signin(username, email, password)
  visit user_session_path
  fill_in 'Username', with: username
  fill_in 'Email', with: email
  fill_in 'Password', with: password
  fill_in 'Password confirmation', with: password
  click_button 'Sign in'
end
# As a user, I want to sign in and out of Blocitoff.
 
describe "Signing in" do
  describe "successfully" do
    signin('newuser','existin@example.com','password')

    it "displays a flash message indicating success"
    expect(page).to have_content("Signed in successfully")
  end
end
 
  describe "unsuccsfully" do
    it "re-renders the page"
  end
