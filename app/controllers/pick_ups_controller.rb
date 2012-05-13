class PickUpsController < ApplicationController
  def create
    room = Room.find(params[:room_id])
    item = room.items.find(params[:item_id])
    PickUp.new(:room => room, :item => item, :user => current_user).execute
    redirect_to room_path(room)
  end
end