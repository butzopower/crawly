require 'spec_helper'

describe RoomsController do
  let(:user) { create(:user) }
  let(:room) do
    create(:room).tap do |room|
      room.exits << create(:exit)
      room.items << create(:item)
    end
  end

  describe "GET #show" do
    before do
      subject.stub(:current_user).and_return(user)
    end

    context 'user is in the room' do
      before do
        user.room = room
        user.save
        get :show, id: room.to_param
      end

      it 'should assign the room' do
        assigns(:room).should == room
      end

      it 'should assign the exits' do
        assigns(:exits).should == room.exits
      end

      it 'should assign the items' do
        assigns(:items).should == room.items
      end
    end

    context 'user is in another room' do
      it 'should redirect them to that room' do
        other_room = create(:room, name: 'Some other room')
        user.room = other_room

        get :show, id: room.to_param
        response.should redirect_to room_path(other_room)
      end
    end
  end
end