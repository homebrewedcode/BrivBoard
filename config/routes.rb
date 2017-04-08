Rails.application.routes.draw do
  devise_for :users
  resources :comments, except: [:show, :index]
  resources :posts
  root 'posts#index'
end

