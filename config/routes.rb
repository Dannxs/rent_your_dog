Rails.application.routes.draw do
  root to: 'pages#home'
  resources :dogs, only: [:index, :new, :create, :show]
  devise_for :users
  get 'dashboard', to: 'pages#dashboard'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
