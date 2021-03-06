Rails.application.routes.draw do
  resources :groups do
    member do
      post :join
      post :quit
    end
    resources :posts
  end

  namespace :account do
    resources :groups
    resources :posts
  end

  devise_for :users

  root to: 'groups#index'
end
