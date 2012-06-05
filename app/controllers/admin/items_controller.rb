class Admin::ItemsController < Admin::BaseController
  inherit_resources
  actions :index, :new, :create, :edit, :update
end