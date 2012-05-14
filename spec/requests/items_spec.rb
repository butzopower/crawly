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
    before do
      room = create(:room, name: 'Labratory')
      item = create(:item, name: 'Test Tube', room: room)

      visit '/'
      visit room_path(room)
    end

    it 'should show the items' do
      page.should have_content '1 Item here'
      page.should have_content 'A Test Tube'
    end

    it 'should allow the user to pick up the item' do
      click_button 'Pick Up'

      click_link 'Inventory'
      page.should have_content 'A Test Tube'
    end
  end
end