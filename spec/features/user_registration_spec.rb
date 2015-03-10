require 'rails_helper'

describe "signup page" do
  it "should have the content 'User Registration'" do
    visit '/new_user'
    page.should have_content ('User Registration')
  end
end

describe "signup flow" do

    within 'form' do
          click_button 'Sign Up'
        end

    describe "successful" do
      it "redirects to the new user form" do
        user = create(:user)
        visit root_path

        within '.user-info' do
          click_link 'Sign Up'
        end
        fill_in 'Username', with: user.name
        fill_in 'Email', with: user.email
        fill_in 'Password', with: user.password

        click_button('user.form.submit')

         expect(page).to have_content(expected_error)
      end
    end
  end
# spec/features/user_creates_a_foobar_spec.rb

feature "Sign up" do
      background do
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


#fill_in('First Name', :with => 'John', 'Last Name', :with=> 'Doe')
#fill_in('Password', :with => 'Seekrit')
#expect(page).to have_field("Username", with: "Joe")