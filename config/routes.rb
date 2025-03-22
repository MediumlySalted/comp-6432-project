Rails.application.routes.draw do
  root "pages#home", as: "home"

  resources :recipes, only: [ :index ]
end
