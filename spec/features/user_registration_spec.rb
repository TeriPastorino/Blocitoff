require 'rails_helper'

  describe "signup page" do
    it "should have the content 'Sign up'" do
      visit new_user_registration_path
    end
  end
  

  describe "sign up user" do
    it "new account" do
      visit new_user_registration_path
        fill_in 'Username', with: 'username'
        fill_in 'Email', with: 'user@example.com'
        fill_in 'Password', with: 'password'
        fill_in 'Password confirmation', with: 'password'
        click_button 'Sign up'

        expect(current_path).to eq root_path
        expect(page).to have_content('activate')
    end
  end

  describe "authenticate" do
         visit new_user_registration_path

    it "should validate email" do

        fill_in 'Username', with: 'username'
        fill_in 'Email', with: 'user@example.com'
        fill_in 'Password', with: 'password'
        fill_in 'Password confirmation', with: 'password'
        click_button 'Sign up'

        expect_error_messages "Email is invalid"
      end



      describe "confirm user" do
        it "receives email confirmation" do
        

        end
      end



     


    describe 'User can sign out' do
      it 'as a user' do
        #sign_in

        #click_link "Logout"

        #expect(page).to have_content "Sign up"
      end
    end
  

#


