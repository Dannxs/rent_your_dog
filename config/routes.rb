Rails.application.routes.draw do
  root to: 'pages#home'
  resources :dogs, only: [:index, :new, :create, :show] do
    resources :bookings, only: [ :new, :create ]
  end
  devise_for :users
  get 'dashboard', to: 'pages#dashboard'
end
