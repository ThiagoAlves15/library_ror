Rails.application.routes.draw do
  devise_for :users, path: 'auth', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'register'
  }, controllers: {
    registrations: 'users/registrations'
  }

  resources :reserves
  resources :books
  resources :users

  root 'home#index'
end
