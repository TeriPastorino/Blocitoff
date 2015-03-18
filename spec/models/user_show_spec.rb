require 'rails_helper'



describe "Show page" do
  let!(:user) { FactoryGirl.create(:user) } 

  it "redirects user to show page" do
    visit user_session_path #visit users/sign_in page
    fill_in 'Email',    with: user.email
    fill_in 'Password', with: user.password
    click_button "Sign In"
    expect(current_path).to eq users_show_path
  end

  it "displays user is signed in"
  
end

  