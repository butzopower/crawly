class MovesController < ApplicationController
  def create
    @room = Room.find(params[:room_id])
    @exit = @room.exits.find(params[:exit_id])
    redirect_to @exit.destination
  end
end