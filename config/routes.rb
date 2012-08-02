Shorty::Application.routes.draw do
  resources :short_urls, only: [ :index, :new, :create, :destroy, :show ]
  resources :users, except: [:index]
  resources :sessions, only: [ :new, :create, :destroy ]
  
  root :to => 'sessions#new'
  match '/signin', to: 'sessions#new'
  match '/signout', to: 'sessions#destroy'
  
  match '/:id', to: 'short_urls#reroute'

end
