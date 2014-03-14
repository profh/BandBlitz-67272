BandBlitz::Application.routes.draw do
  # Generated routes
  resources :bands
  resources :genres

  # Default route
  root :to => 'bands#index', :as => :home
end
