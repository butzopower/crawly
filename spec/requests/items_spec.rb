require 'spec_helper'

describe "Item interactions" do
  describe "A user's inventory" do
    it "should show the user's items" do
      create(:room, name: 'The Void')
      visit '/'

      wait_until { @user = User.last }
      item = create(:item, name: 'Machine Gun', user: @user)

      click_link 'View Inventory'
      page.should have_content 'A Machine Gun'
    end
  end

  describe "A room having items" do
    it 'should show the items' do
      room = create(:room, name: 'Labratory')
      item = create(:item, name: 'Test Tube', room: room)

      visit room_path(room)
      page.should have_content 'There is a Test Tube here.'
    end
  end
end