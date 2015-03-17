require 'rails_helper'

#include TestFactories

def signup(username, email, password)
  visit new_user_registration_path
  fill_in 'Username',   with: username
  fill_in 'Email',      with: email
  fill_in 'Password',   with: password
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

describe "witout validation errors" do
  it "redirects to the index page" do
    signup('newuser', 'newuser@example.com', 'password')
    expect(current_path).to eq "/"
    expect(page).to have_content('activate')
  end  
end
end


describe "confirm user" do
  let(:current_email) {ActionMailer::Base.deliveries.last}
  it "sends a confirmation email" do

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
  
describe "Signing in" do
  describe "unsuccessfully" do
    it "displays 'Email can't be blank'" do
      signup('newuser', '', 'password')
      expect(page).to have_content("Email can't be blank")
    end
  end
end

#this one fails
describe "using an already existing email" do
  it "displays 'Error prohibited user from being saved'" do

    create(:user, email: "existing@example.com")
    visit new_user_registration_path
    fill_in 'Email',    with: "existing@example.com"
    click_button "Sign up"
    expect(page).to have_content("prohibited")
  end
end
#end
# As a user, I want to sign in and out of Blocitoff.
 
describe "Signing in" do

  describe "successfully" do
    let!(:user) { FactoryGirl.create(:user) } 
    it "displays a flash message indicating success" do
      visit user_session_path #visit users/sign_in page
      fill_in 'Email',    with: user.email
      fill_in 'Password', with: user.password
      click_button "Sign In"
      expect(current_path).to eq user_path(user)
      expect(page).to have_content("Hello")
    end
  end

  describe "successfully" do
    let!(:user) { FactoryGirl.create(:user) } 
    it "resets password" do
      visit user_session_path
      click_link  'Forgot your password' 
      expect(current_path).to eq "/users/password/new"
      fill_in 'Email',    with: user.email
      click_button "Send me reset password instructions"
      expect(current_path).to eq "/users/sign_in"
    end
  end
   
  describe "Signing out" do
    let!(:user) { FactoryGirl.create(:user) } 
    it "re-renders the page" do
      visit user_session_path #visit users/sign_in page
      fill_in 'Email',    with: user.email
      fill_in 'Password', with: user.password
      click_button "Sign In"
      expect(current_path).to eq user_path(user)
      click_link 'sign out'
      expect(page).to have_content("Signed out successfully")
    end
  end
end
