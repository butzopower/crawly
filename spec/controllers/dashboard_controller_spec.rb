require 'spec_helper'

describe DashboardController do
  describe 'GET #index' do
    let!(:room) { create :room }

    it 'should redirect to the first room' do
      get :index
      response.should redirect_to(room_path(room))
    end

    it 'should set the current_user' do
      expect { get :index }.to change(User, :count).by(1)
      session[:user_id].should == User.last.id
      User.last.room.should == Room.first
    end
  end
end