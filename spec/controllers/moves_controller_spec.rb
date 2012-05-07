require 'spec_helper'

describe MovesController do
  let(:destination) { create :room }
  let(:exit) { create :exit, destination: destination }
  let(:room) { create :room, exits: [exit] }

  describe 'POST #create' do
    before do
      post :create, room_id: room.to_param, exit_id: exit.to_param
    end

    it 'should assign room' do
      assigns(:room).should == room
    end

    it 'should assign exit' do
      assigns(:exit).should == exit
    end

    it 'should move the player' do
      response.should redirect_to destination
    end
  end
end