Rails.application.routes.draw do
  devise_for :users

  root to: "pages#home"

  get "performances/search"
  resources :performances, only: %i[show]
end
