class DropsController < ApplicationController
  def create
    room = Room.find(params[:room_id])
    item = current_user.items.find(params[:item_id])
    Drop.new(:room => room, :item => item, :user => current_user).execute

    redirect_to room_path(room)
  end
end