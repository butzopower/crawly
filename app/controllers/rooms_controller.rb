class RoomsController < ApplicationController
  def show
    @room = Room.find(params[:id])
    @exits = @room.exits
  end
end