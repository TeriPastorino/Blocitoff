require 'rails_helper'

  describe "signup page" do
    it "should have the content 'Sign up'" do
      visit new_user_registration_path
      expect(page).to have_content('Sign up')
    end
  end
  
# THIS TEST IF FAILING - it says users already exists - set up user factory? and use database cleaner to test???
  describe "sign up user" do
    it "new account" do
      visit new_user_registration_path
        fill_in 'Username', with: 'newuser'
        fill_in 'Email', with: 'newuser@example.com'
        fill_in 'Password', with: 'password'
        fill_in 'Password confirmation', with: 'password'
        click_button 'Sign up'

        expect(current_path).to eq "/users"
        expect(page).to have_content('activate')
    end
  end

  #This is not testing correctly because it should stop due to missing email address
  describe "authenticate" do
    before do 
      visit new_user_registration_path
    end
      it "is invalid without an email" do
    
        fill_in 'Username', with: 'newtestuser'
        fill_in 'Email', with: (" ")
        fill_in 'Password', with: 'password'
        fill_in 'Password confirmation', with: 'password'
        click_button 'Sign up'
    
      expect('Email').to not_to eq(" ")
      expect(flash[:error]).to eq "Invalid Email"
  end
end
      
    

    #is this supposed to be a controller test? how do i know which tests go where, can we make a list

      describe "confirm user" do
        it "receives email confirmation" do
        expect(page).to have_content("Email sent")
        ActionMailer::Base.deliveries.last
        #expect(last_email).to include(user.email)
        #example from railscasts - don't have these methods

        end
      end
# do i need to set up factory stuff to get this to work?
      describe "unique email" do
      xit "signs up new user" do
      end
    end

    #the next two go together but how to set up?

    describe "display a user" do
      xit "is signed in" do
      before do
        #user signed in

end

      end
    end


    describe "User can sign out" do
      xit "as a user" do
        #sign_in
        #click_link "Logout"
        #expect(page).to have_content "Sign up"
      end
    end