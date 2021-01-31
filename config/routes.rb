Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # get 'auth/:provider/callback', to: 'sessions#create'
  # get 'auth/failure', to: redirect('/')

  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :posts do
    resources :comments
  end
  get '/users/:id/friends', to: 'friends#index'
  get '/users', to: 'users#index'
  get '/users/:id', to: 'users#show'
  resources :users
  resources :friends

  resources :friendships
  resources :notifications, only: [:create, :index]
  resources :notification_sessions, only: [:create]
  resources :likes


  root 'posts#index'
end
