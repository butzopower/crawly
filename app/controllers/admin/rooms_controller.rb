class Admin::RoomsController < Admin::BaseController
  inherit_resources
  actions :index, :new, :create, :edit, :update

  def new
    new! do
      @room.exits.build
    end
  end

  def edit
    edit! do
      @room.exits.build
    end
  end

end