require 'spec_helper'

describe 'The item admin page' do
  let!(:room) { create :room, name: 'Throne Room' }

  it 'should allow an admin to add an item to a room' do
    visit '/admin'
    click_link 'Items'
    click_link 'New Item'
    fill_in 'Name', with: 'Crown'
    select 'Throne Room', from: 'Room'
    click_button 'Create'

    wait_until { @item = Item.last }
    within("tr#item#{@item.id}") do
      page.should have_content 'Throne Room'
      page.should have_content 'Crown'
    end
  end

  it 'should allow an admin to move an item from a player to a room' do
    user = create :user
    item = create :item, user: user
    visit '/admin'
    click_link 'Items'

    click_link 'Edit'
    select 'Throne Room', from: 'Room'
    click_button 'Update'

    within("tr#item#{item.id}") do
      page.should have_content 'Throne Room'
      page.should_not have_content user.id
    end
  end
end