require 'spec_helper'

describe Admin::RoomsController do
  describe 'GET #index' do
    before do
      create(:room)
      get :index
    end

    its(:response) { should be_success }
    it { assigns(:rooms).should == Room.all }
  end

  describe 'GET #new' do
    before do
      get :new
    end

    its(:response) { should be_success }
    it { assigns(:room).should be_new_record }
    it { assigns(:room).should be_a(Room) }

    it 'should give a room a new exit' do
      assigns(:room).exits.size.should == 1
      assigns(:room).exits.last.should be_new_record
      assigns(:room).exits.last.should be_a(Exit)
    end
  end

  describe 'POST #create' do
    before do
      expect do
        post :create, room: {name: 'Foo', description: 'Bar'}
      end.to change(Room, :count).by(1)
    end

    it 'should create with the params' do
      Room.last.name.should == 'Foo'
      Room.last.description.should == 'Bar'
    end

    its(:response) { should redirect_to admin_rooms_path }
  end

  describe 'GET #edit' do
    let(:room) { create :room, exits: [create(:exit)] }

    before do
      get :edit, id: room.to_param
    end

    its(:response) { should be_success }
    it { assigns(:room).should == room }
    it 'should give the room a new exit' do
      assigns(:room).exits.size.should == 2
      assigns(:room).exits.last.should be_new_record
      assigns(:room).exits.last.should be_a(Exit)
    end

  end

  describe 'PUT #update' do
    let(:room) { create :room }

    before do
      put :update, id: room.to_param, room: {name: 'My Room', description: 'Plain white room'}
    end

    it 'should update the room' do
      room.reload
      room.name.should == 'My Room'
      room.description.should == 'Plain white room'
    end

    its(:response) { should redirect_to admin_rooms_path }
  end
end