Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
  devise_for :users
  root 'posts#index'
  namespace :user do
    resources :posts
    resources :profiles
    get '/follows', to: 'follows#follow', as: 'user_follows'
    get '/followers', to: 'follows#follower', as: 'user_followers'
  end
  post '/follows', to: 'follows#create', as: 'follows'
  post '/unfollows', to: 'follows#destroy', as: 'unfollows'
  get '/all_users', to: 'users#index', as: 'all_users'
  get '/user/:id', to: 'users#show', as: 'select_user_profile'
  resources :likes, only: [:create, :destroy]
  resources :comments, only: [:create, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
