require 'rails_helper'



describe "Show page" do
  let!(:user) { FactoryGirl.create(:user) } 

  it "displays user is signed in" do
    visit user_session_path #visit users/sign_in page
    fill_in 'Email',    with: user.email
    fill_in 'Password', with: user.password
    click_button "Sign In"
    expect(current_path).to eq user_path(user)
    expect(page).to have_content(user.name)
  end
  
end

  