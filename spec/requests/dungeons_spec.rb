require 'spec_helper'

describe "A really simple hallway" do
  before do
    setup_dungeon
    visit '/'
    page.should have_button('Continue')
    click_button 'Continue'
  end

  it 'should allow the user to go down the hallway' do
    page.should have_content('Further down the hallway.')
  end

  def setup_dungeon
    room1 = create :room, description: 'The start of the hallway.'
    room2 = create :room, description: 'Further down the hallway.'
    room1.exits << create(:exit, name: 'Continue', destination: room2)
  end
end