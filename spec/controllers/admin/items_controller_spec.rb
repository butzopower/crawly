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

  describe 'GET #edit' do
    let(:item) { create :item }

    it 'should load the item' do
      get :edit, id: item.to_param

      assigns(:item).should == item
    end
  end

  describe 'PUT #update' do
    let(:item) { create :item, name: 'A gun' }
    def make_request
      put :update, id: item.to_param, item: { name: 'A sword' }
    end

    it 'should update the item' do
      expect {
        make_request
      }.to change{ item.reload.name }.from('A gun').to('A sword')
    end

    it 'should redirect to index' do
      make_request
      response.should redirect_to action: :index
    end
  end
end