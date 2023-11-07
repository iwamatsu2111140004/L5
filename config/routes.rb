Rails.application.routes.draw do
  resources :users
  resources :tweets
  root 'tweets#index'
  get 'top/main'
  post 'top/login'
  get 'top/logout'
  resources :likes, only: [:create, :destroy]
end
