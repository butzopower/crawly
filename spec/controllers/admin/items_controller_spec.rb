require 'spec_helper'

describe Admin::ItemsController do
  describe 'GET #index' do
    let!(:item) { create :item }
    it 'should assign @items' do
      get :index
      assigns(:items).should == Item.all
    end
  end

  describe 'GET #new' do
    it 'should assign @item' do
      get :new
      assigns(:item).should be_new_record
      assigns(:item).should be_a(Item)
    end
  end

  describe 'POST #create' do
    let!(:room) { create :room }

    it 'should create the item' do
      expect do
        post :create, item: { name: 'Boss Key', room_id: room.id }
      end.to change(Item, :count).by(1)

      Item.last.name.should == 'Boss Key'
      Item.last.room_id.should == room.id
    end
  end
end