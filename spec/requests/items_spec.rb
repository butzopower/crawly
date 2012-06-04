require 'spec_helper'

describe "Item interactions" do
  describe "A user's inventory" do
    it "should show the user's items" do
      create(:room, name: 'The Void')
      visit '/'

      wait_until { @user = User.last }
      item = create(:item, name: 'Machine Gun', user: @user)

      visit '/'

      within('.inventory') do
        page.should have_content 'A Machine Gun'
      end
    end
  end

  describe "A room" do
    before do
      room = create(:room, name: 'Labratory')
      @item = create(:item, name: 'Test Tube', room: room)

      visit '/'
      visit room_path(room)
    end

    it "should show it's' items" do
      within('.room') do
        page.should have_content '1 Item here'
        page.should have_content 'A Test Tube'
      end
    end

    it 'should allow the user to pick up the item', js: true do
      within('.room') do
        page.find("#item-#{@item.id}-header").click
        click_button 'Pick Up'
      end

      within('.inventory') do
        page.should have_content 'A Test Tube'
      end
    end

    it 'should allow the user to drop the item' do
      within('.room') do
        page.should have_content '1 Item here'
        page.should have_content 'A Test Tube'
        click_button 'Pick Up'
      end

      within('.room') do
        page.should have_no_content 'A Test Tube'
      end

      within('.inventory') do
        click_button 'Drop'
      end

      within('.room') do
        page.should have_content '1 Item here'
        page.should have_content 'A Test Tube'
      end
    end
  end
end