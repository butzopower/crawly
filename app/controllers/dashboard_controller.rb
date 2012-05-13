class DashboardController < ApplicationController
  def index
    current_user #initialize the user
    redirect_to(Room.first)
  end
end
