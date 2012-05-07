require 'spec_helper'

describe 'The Room admin page' do
  it 'should allow an admin to create a manage rooms' do
    create_room
    edit_room
  end

  def create_room
    visit '/admin/rooms'
    click_link 'New Room'
    fill_in 'Name', with: 'Outside'
    fill_in 'Description', with: "It's a beautiful sunny day out."
    click_button 'Create'
    page.should have_content 'Outside'
    page.should have_content "It's a beautiful sunny day out."
  end

  def edit_room
    visit '/admin/rooms'
    click_link 'Edit'
    fill_in 'Name', with: 'Inside'
    fill_in 'Description', with: "Inside there is a big cake."
    click_button 'Update'
    page.should have_content 'Inside'
    page.should have_content "Inside there is a big cake."
  end
end