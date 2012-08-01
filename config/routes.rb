Shorty::Application.routes.draw do
  resources :short_urls, only: [ :new, :create, :destroy, :show ]
  resources :users, except: [:index]
  
  root :to => 'short_urls#new'
  
  match '/:id', to: 'short_urls#reroute'

end
