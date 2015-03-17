require 'rails_helper'



describe "Show page" do
  let!(:user) { FactoryGirl.create(:user) } 

  it "displays user is signed in" do
    # sign in
    expect(page).to have_content(user.username)
  end
  
end

  