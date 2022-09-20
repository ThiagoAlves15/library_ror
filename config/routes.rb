Rails.application.routes.draw do
  resources :reserves
  resources :books
  devise_for :users
  resources :users

  root "home#index"
end
