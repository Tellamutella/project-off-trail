Rails.application.routes.draw do
  get 'bookings/create'
  get 'bookings/destroy'
  get 'locations/new'
  get 'locations/create'
  get 'locations/edit'
  get 'locations/update'
  get 'locations/destroy'
  get 'locations/index'
  get 'locations/show'
  devise_for :users
  root to: 'pages#home'
  get 'dashboard', to: 'users#dashboard'

  resources :locations do
    resources :bookings, only: %i[create]
  end

  resources :bookings, only: %i[destroy]
end
