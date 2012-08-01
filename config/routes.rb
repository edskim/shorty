Shorty::Application.routes.draw do
  resources :short_urls, only: [ :new, :create, :destroy, :show ]
  
  root :to => 'short_urls#new'

end
