require 'spec_helper'

describe RoomsController do
  let(:room) do
    create(:room).tap do |room|
      room.exits << create(:exit)
    end
  end

  describe "GET #show" do
    before do
      get :show, id: room.to_param
    end

    it 'should assign the room' do
      assigns(:room).should == room
    end

    it 'should assign the exits' do
      assigns(:exits).should == room.exits
    end
  end
end