require 'spec_helper'

describe DropsController do
  let(:item) { create(:item) }
  let(:room) { create(:room) }
  let(:user) { create(:user, items: [item]) }

  describe 'POST #create' do
    before do
      subject.stub(:current_user).and_return(user)
    end

    it 'should make a drop' do
      drop_mock = double('drop')
      Drop.should_receive(:new).with({user: user, item: item, room: room}).and_return(drop_mock)
      drop_mock.should_receive(:execute)

      post :create, room_id: room.to_param, item_id: item.to_param
    end

    it 'should redirect to the room' do
      post :create, room_id: room.to_param, item_id: item.to_param

      response.should redirect_to(room_path(room))
    end
  end
end