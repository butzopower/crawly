require 'spec_helper'

describe PickUpsController do
  let(:item) { create(:item) }
  let(:room) { create(:room, items: [item]) }
  let(:user) { create(:user) }

  describe 'POST #create' do
    before do
      subject.stub(:current_user).and_return(user)
    end

    it 'should make a pick up' do
      pick_up_mock = double('pick up')
      PickUp.should_receive(:new).with({user: user, item: item, room: room}).and_return(pick_up_mock)
      pick_up_mock.should_receive(:execute)

      post :create, room_id: room.to_param, item_id: item.to_param
    end

    it 'should redirect to the room' do
      post :create, room_id: room.to_param, item_id: item.to_param

      response.should redirect_to(room_path(room))
    end
  end
end