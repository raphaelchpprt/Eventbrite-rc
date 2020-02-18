Rails.application.routes.draw do
  devise_for :users
  root 'events#index'
  resources :users, only: [:show]
  resources :events, only: [:new, :create, :show]
end
