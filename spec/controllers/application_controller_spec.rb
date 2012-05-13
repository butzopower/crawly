require 'spec_helper'

describe ApplicationController do
  describe 'current_user' do
    context 'session[:user_id] is set' do
      it 'should return the user from session[:user_id]' do
        user = create(:user)
        session[:user_id] = user.id
        subject.send(:current_user).should == user
      end
    end

    context 'session[:user_id] is not set' do
      it 'should create a user and set it' do
        expect { @user = subject.send(:current_user) }.to change(User, :count).by(1)
        @user.should == User.last
        session[:user_id].should == User.last.id
      end
    end

  end
end