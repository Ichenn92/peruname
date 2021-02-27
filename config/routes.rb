Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :performances, only: %i[search]
end
