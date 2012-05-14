require 'spec_helper'

describe MovesController do
  let(:destination) { create :room }
  let(:exit) { create :exit, destination: destination }
  let(:room) { create :room, exits: [exit] }
  let(:user) { create :user, room: room }

  describe 'POST #create' do
    def make_request
      post :create, room_id: room.to_param, exit_id: exit.to_param
    end

    before do
      subject.stub(:current_user).and_return(user)
    end

    it 'should assign room' do
      make_request
      assigns(:room).should == room
    end

    it 'should assign exit' do
      make_request
      assigns(:exit).should == exit
    end

    it 'should create a move' do
      move_mock = double('move')
      Move.should_receive(:new).with({user: user, exit: exit, room: room}).and_return(move_mock)
      move_mock.should_receive(:execute)

      make_request
    end

    it 'should move the player' do
      make_request
      response.should redirect_to destination
    end
  end
end