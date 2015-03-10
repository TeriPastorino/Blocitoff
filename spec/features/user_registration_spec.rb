require 'rails_helper'

describe "signup page" do
  it "should have the content 'Sign up'" do
    visit new_user_registration_path
    expect(page).to have_content('Sign up')
  end
end

describe "signup flow" do

  describe "successful" do
    it "redirects to the new user form" do
      visit root_path

      click_link 'Sign Up'

      fill_in 'Username', with: 'tpasto'
      fill_in 'Email', with: 'tpasto@comcast.net'
      fill_in 'Password', with: 'password'

      click_button('Sign up')
    end
  end
end

describe "Sign up" do
  before do
    User.make(:email => 'user@example.com', :password => 'caplin')
  end

  scenario "Signing in with correct credentials" do
    visit '/sessions/new'
    within("#session") do
      fill_in 'Login', :with => 'user@example.com'
      fill_in 'Password', :with => 'caplin'
    end
    click_link 'Sign in'
    page.should have_content 'Success'
  end
end


#fill_in('First Name', :with => 'John', 'Last Name', :with=> 'Doe')
#fill_in('Password', :with => 'Seekrit')
#expect(page).to have_field("Username", with: "Joe")