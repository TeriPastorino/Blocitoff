require 'rails_helper'

#this is failing even though it says passing
describe "Items", js: true do
  let!(:user) { FactoryGirl.create(:user) } 
  before do
    login_as(user, scope: :user, run_callbacks: false) 
    visit user_path(user)
    expect(current_path).to eq user_path(user)
  end
  describe "creation" do
    it "adds a todo" do
      fill_in 'Description', with: "Really long text"
      expect do 
        click_button 'Add Item To List'
      end.to change {user.items.count}.by 1
      expect(page).to have_content "Really long text"
    end

    it "adds multiple todo's" do
      3.times do |i|
        fill_in "Description", with: "Really long text #{i}"
        click_button "Add Item To List"
        expect(page).to have_content "Really long text #{i}"        
      end
    end
  end

  describe "deletion" do
    it "using ajax" do
    end

    it "multiple" do
    end
  end
end
#? can you loop x num of times
#moved everything else to pending items
