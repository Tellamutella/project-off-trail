Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'dashboard', to: 'users#dashboard'

  resources :locations do
    resources :bookings, only: %i[create]
  end

  resources :bookings, only: %i[destroy]
end
