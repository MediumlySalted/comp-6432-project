Rails.application.routes.draw do
  devise_for :users

  root "recipes#index", as: "home"

  resources :recipes
  resources :users, only: [ :show ]
end
