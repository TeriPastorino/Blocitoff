require 'rails_helper'

describe "todo items" do
  include TestFactories
  include Warden::Test::Helpers
  Warden.test_mode!

  #need a signed in user

describe "successful" do
  it "can create multiple"
    visit user_session_path
    fill_in "Description", with: "Really long text..."
    click_button('Add Item To List')
    
  end

  it "displays new"
  end

   it "can delete multiple"
  end
  00p
   it "use ajax to delete"
  end
end