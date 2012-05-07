Crawly::Application.routes.draw do
  namespace :admin do
    resources :rooms
  end

  resources :rooms do
    resource :move
  end

  root :to => 'dashboard#index'
end
