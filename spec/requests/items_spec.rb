require 'spec_helper'

describe "Item interactions" do
  describe "A room having items" do
    it 'should show the items' do
      room = create(:room, name: 'Labratory')
      item = create(:item, name: 'Test Tube', room: room)

      visit room_path(room)
      page.should have_content 'There is a Test Tube here.'
    end
  end
end