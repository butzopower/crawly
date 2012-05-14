class DashboardController < ApplicationController
  def index
    current_user.room ||= Room.first
    current_user.save
    redirect_to(current_user.room)
  end
end
