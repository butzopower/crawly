require 'spec_helper'

describe InventoriesController do
  describe 'GET #show' do
    it "should set @items to current user's items" do
      user = create(:user)
      item = create(:item, name: 'Piggybank', user: user)
      subject.stub(:current_user).and_return(user)

      get :show

      assigns(:items).should == [item]

    end
  end
end