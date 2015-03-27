require 'rails_helper'

describe "successfully" do
    let!(:user) { FactoryGirl.create(:user) } 
    it "displays a flash message indicating success" do
      visit user_session_path #visit users/sign_in page
      fill_in 'Email',    with: user.email
      fill_in 'Password', with: user.password
      click_button "Sign In"
      expect(current_path).to eq user_path(user)
      
    fill_in 'Description', with: "Really long text"
    click_button('Add Item To List')
    expect(page).to have_content "Really long text"
  end
end
#? can you loop x num of times
xit "can create multiple" do
  visit user_session_path
  sign_in @user
    3.times do
      fill_in "Description", with: "Really long text"
      click_button "Add Item To List"
  end
  end
#is click_link proper for selecting the glyph and how do i tell it which one?
   xit "can delete multiple" do
    visit user_session_path
    click_link 'glyphicon glyphicon-ok'
    expect
  end
#how to distinguish in test delete vs delete w/ajax?
   xit "use ajax to delete" do
    visit user_session_path
    click_link 'glyphicon glyphicon-ok'
    expect
  end

