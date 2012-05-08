require 'spec_helper'

describe 'The Room admin page' do
  it 'should allow an admin to create a manage rooms' do
    create_room
    edit_room
  end

  def create_room
    visit '/admin'
    click_link 'Rooms'
    click_link 'New Room'
    fill_in 'Name', with: 'Outside'
    fill_in 'Description', with: "It's a beautiful sunny day out."
    click_button 'Create'
    page.should have_content 'Outside'
    page.should have_content "It's a beautiful sunny day out."
  end

  def edit_room
    visit '/admin'
    click_link 'Rooms'
    click_link 'Edit'
    fill_in 'Name', with: 'Inside'
    fill_in 'Description', with: "Inside there is a big cake."
    click_button 'Update'
    page.should have_content 'Inside'
    page.should have_content "Inside there is a big cake."
  end

  it 'should allow an admin to manage a rooms exits', js: true do
    @room1 = create(:room, name: 'The Bedroom')
    @room2 = create(:room, name: 'The Office')

    create_exit
    delete_exit
  end

  def create_exit
    visit '/admin'
    click_link 'Rooms'
    within("tr#room#{@room1.id}") do
      click_link 'Edit'
    end

    within('ul.exits li:first-child') do
      fill_in 'Name', with: 'Go to the office'
      select 'The Office', from: 'Destination'
    end

    click_button 'Update'

    visit room_path(@room1)

    click_button 'Go to the office'
    page.current_path.should == room_path(@room2)
  end

  def delete_exit
    visit '/admin'
    click_link 'Rooms'
    within("tr#room#{@room1.id}") do
      click_link 'Edit'
    end

    within('ul.exits li:first-child') do
      click_link 'X'
    end

    click_button 'Update'
    visit room_path(@room1)
    page.should_not have_button('Go to the office')
  end
end