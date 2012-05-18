require 'spec_helper'

describe InventoriesController do
  describe 'GET #show' do
    before do
      @user = create(:user)
      @item = create(:item, name: 'Piggybank', user: @user)
      subject.stub(:current_user).and_return(@user)
    end

    it "should set @items to current user's items" do
      get :show

      assigns(:items).should == [@item]
    end

    it "should assign @room" do
      @user.room = create(:room)
      get :show
      assigns(:room).should == @user.room
    end
  end
end