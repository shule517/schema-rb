Rails.application.routes.draw do
  root 'home#index'
  resources :tables
  resources :homes
  resources :simulators
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
