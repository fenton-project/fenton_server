Rails.application.routes.draw do
  resources :organizations
  resources :certificates
  resources :clients
  resources :projects
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end
