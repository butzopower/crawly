class Admin::RoomsController < Admin::BaseController
  inherit_resources
  actions :index, :new, :create, :edit, :update
end