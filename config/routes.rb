Rails.application.routes.draw do
  root to: 'pages#home'
  resources :dogs do
    resources :bookings, only: [ :new, :create ]
  end
  resources :bookings, only: [:update] do
    resources :reviews, only: [:new, :create]
  end
  devise_for :users
  get 'dashboard', to: 'pages#dashboard'
end
