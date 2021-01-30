Rails.application.routes.draw do
  devise_for :users
  root 'landings#index'
  namespace :user do
    resources :posts
  end
  resources :likes
  resources :comments
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
