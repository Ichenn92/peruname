Rails.application.routes.draw do
  devise_for :users

  root to: "pages#home"

  get "performances/search"
  resources :performances, only: %i[show new create]

  # resources :users, only: %i[show] do
  #   # resources :bookings, only: %i[index]
  #   # resources :performances
  # end
end
