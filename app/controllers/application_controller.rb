class ApplicationController < ActionController::Base
  protect_from_forgery

  def current_user
    if session[:user_id].present?
      User.find(session[:user_id])
    else
      User.create.tap{|user| session[:user_id] = user.id }
    end
  end
end
