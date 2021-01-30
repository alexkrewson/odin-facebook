Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :posts do
    resources :comments
  end
  get '/users/:id/friends', to: 'friends#index'
  get '/users', to: 'users#index'

  resources :friendships
  resources :notifications, only: [:create, :index]
  resources :notification_sessions, only: [:create]


  root 'posts#index'
end
