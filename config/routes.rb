Crawly::Application.routes.draw do
  namespace :admin do
    root :to => 'dashboard#index'
    resources :rooms
  end

  resource :inventory, only: :show
  resources :rooms do
    resource :move
  end

  root :to => 'dashboard#index'
end
