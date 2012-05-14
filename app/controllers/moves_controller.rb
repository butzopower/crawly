class MovesController < ApplicationController
  def create
    @room = Room.find(params[:room_id])
    @exit = @room.exits.find(params[:exit_id])

    Move.new(user: current_user, room: @room, exit: @exit).execute

    redirect_to current_user.room
  end
end