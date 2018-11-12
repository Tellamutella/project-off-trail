Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :locations do
    resources :bookings, only: %i[create]
  end
end
