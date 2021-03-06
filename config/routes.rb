Shorty::Application.routes.draw do
  resources :short_urls, only: [ :index, :new, :create, :destroy, :show ]
  resources :users, except: [:index]
  resources :sessions, only: [ :new, :create, :destroy ]
  resources :reroutes, only: [ :create ] #, :index, :show, :destroy ]
  
  root :to => 'short_urls#new'
  match '/signin', to: 'sessions#new'
  match '/signout', to: 'sessions#destroy'
  
  match '/:id', to: 'reroutes#create'

end
