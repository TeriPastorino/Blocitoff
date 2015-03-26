require 'rails_helper'

describe "todo items" do
  before { login_as FactoryGirl.create(:user) } do

describe "successfully" do
  it "can display" do
    visit user_session_path
    fill_in "Description", with: "Really long text"
    click_button('Add Item To List')
    expect(page). to have_content "Really long text"
  end
end
#? can you loop x num of times
xit "can create multiple" do
  visit user_session_path
    fill_in "Description", with: "Really long text"
    click_button('Add Item To List')
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
    expects
  end
end
end