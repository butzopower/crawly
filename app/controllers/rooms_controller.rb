class RoomsController < ApplicationController
  before_filter :load_room

  def show
    @exits = @room.exits
    @items = @room.items
  end

  protected

  def load_room
    @room = Room.find(params[:id])
    redirect_to room_path(current_user.room) unless current_user.room == @room
  end
end