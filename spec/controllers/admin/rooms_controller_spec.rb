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
end