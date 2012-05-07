require 'spec_helper'

describe 'The Room admin page' do
  it 'should allow an admin to create a room' do
    visit '/admin/rooms'
    click_link 'New Room'
    fill_in 'Name', with: 'Outside'
    fill_in 'Description', with: "It's a beautiful sunny day out."
    click_button 'Create'
    page.should have_content 'Outside'
    page.should have_content "It's a beautiful sunny day out."
  end
end