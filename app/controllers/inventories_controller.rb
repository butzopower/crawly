class InventoriesController < ApplicationController
  def show
    @items = current_user.items
    @room = current_user.room
  end
end