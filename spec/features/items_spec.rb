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
    let!(:item) {FactoryGirl.create(:item) }
    it "adds a todo" do
      fill_in 'Description', with: :item
      expect do 
        click_button 'Add Item To List'
      expect(items).to change {user.items.count}.by(1)
    end
    end
  end

  describe "creation" do
    let!(:item) {FactoryGirl.create(:item) }
    it "adds multiple todo's" do
      3.times do |i|
        fill_in "Description", with: :item {i}
        click_button "Add Item To List"
      end
        expect(items).to change {user.items.count}.by(3)
        end
      end
    end
  


  describe "deletion" do
    xit "using ajax" do
    end

    xit "multiple" do
    end
  end

