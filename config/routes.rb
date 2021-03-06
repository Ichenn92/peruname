Rails.application.routes.draw do
  devise_for :users

  root to: "pages#home"

  get "performances/search"
  resources :performances
  put "users/settings"

  resources :bookings, only: [:index, :create] do
    post "/confirm", to: "bookings#confirm"
    post "/reject", to: "bookings#reject"
  end
  get "bookings/my_bookings"
  get "bookings/my_performances"
end
