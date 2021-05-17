Rails.application.routes.draw do
  get 'dogs/index'
  get 'dogs/new'
  get 'dogs/create'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
