Rails.application.routes.draw do
  root 'attractions#index'
  resources :attractions
  resources :rides
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
