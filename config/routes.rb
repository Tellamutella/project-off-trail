Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root to: 'pages#home'
  get "scout", to: 'pages#scoutinfo', as: 'scoutinfo'
  get "influencer", to: 'pages#influencerinfo', as: 'influencerinfo'
  get 'dashboard', to: 'users#dashboard'

  resources :locations do
    resources :bookings, only: %i[new create] do
      resources :reviews, only: %i[create]
    end
  end

  get 'search', to: "locations#search"

  resources :bookings, only: %i[destroy]
end
