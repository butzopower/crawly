class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user

  def current_user
    if session[:user_id].present?
      @current_user ||= User.find(session[:user_id])
    else
      @current_user = User.create.tap{|user| session[:user_id] = user.id }
    end
  end

end
