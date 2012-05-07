class DashboardController < ApplicationController
  def index
    redirect_to(Room.first)
  end
end
