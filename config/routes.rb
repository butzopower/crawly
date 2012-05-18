Crawly::Application.routes.draw do
  namespace :admin do
    root :to => 'dashboard#index'
    resources :items
    resources :rooms
  end

  resource :inventory, only: :show
  resources :rooms do
    resource :move
    resource :pick_up
    resource :drop
  end

  root :to => 'dashboard#index'
end
