Rails.application.routes.draw do
  root "pages#home", as: "home"
  get "/home/food", to: "pages#food", as: "food"
  get "/home/cocktails", to: "pages#cocktails", as: "cocktails"

  resources :recipes, only: [ :index ]
end
