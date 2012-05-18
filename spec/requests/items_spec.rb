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

  describe "A room" do
    before do
      room = create(:room, name: 'Labratory')
      item = create(:item, name: 'Test Tube', room: room)

      visit '/'
      visit room_path(room)
    end

    it "should show it's' items" do
      page.should have_content '1 Item here'
      page.should have_content 'A Test Tube'
    end

    it 'should allow the user to pick up the item' do
      click_button 'Pick Up'

      click_link 'Inventory'
      page.should have_content 'A Test Tube'
    end

    it 'should allow the user to drop the item' do
      page.should have_content '1 Item here'
      page.should have_content 'A Test Tube'
      click_button 'Pick Up'
      page.should have_no_content 'A Test Tube'
      click_link 'Inventory'
      click_button 'Drop'
      page.should have_content '1 Item here'
      page.should have_content 'A Test Tube'
    end
  end
end