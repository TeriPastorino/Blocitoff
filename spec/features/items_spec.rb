require 'rails_helper'

#this is failing even though it says passing
describe "User create" do
  describe "items" do
    let!(:user) { FactoryGirl.create(:user) } 
      it "adds a todo" do
        visit user_session_path #visit users/sign_in page
        fill_in 'Email',    with: user.email
        fill_in 'Password', with: user.password
        click_button "Sign In"
        expect(current_path).to eq user_path(user)
        fill_in 'Description', with: "Really long text"
        click_button 'Add Item To List'
        expect(page).to have_content "Really long text"
      end

      it "adds multiple todo's" do
      end

      it "deletes" do
      end

      it "deletes multiple" do
      end
  end
end
#? can you loop x num of times
#moved everything else to pending items
