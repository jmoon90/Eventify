Rails.application.routes.draw do
  root 'home#index'
  resources :events
  resources :home, only: [:index]
end
