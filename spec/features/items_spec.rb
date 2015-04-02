require 'rails_helper'
def login(user)
  visit user_session_path #visit users/sign_in page
  fill_in 'Email',    with: user.email
  fill_in 'Password', with: user.password
  click_button "Sign In"
  expect(current_path).to eq user_path(user)
  expect(page).to have_content(user.name)
end
#this is failing even though it says passing
describe "Items" do
  let!(:user) { FactoryGirl.create(:user) } 
  before do
    login(user)
  end

  describe "creation" do
    it "adds a todo" do
      fill_in 'Description', with: "Do Item"
      expect do 
        click_button 'Add Item To List'
      end.to change {user.items.count}.by(1)
    end
  end

  describe "creation" do
    it "adds multiple todo's" do
      3.times do |i|
        fill_in "Description", with: "Do Item #{i}"
        click_button "Add Item To List"
        expect(page).to have_content("Do Item #{i}")
      end 
    end
  end
end




