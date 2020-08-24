Rails.application.routes.draw do
  root 'articles#index'

  resources :articles

  resources :users, only: [:new, :create, :show]

  resources :categories, only: [:show]

  resources :votes, only: [:show, :create, :destroy]
  
  resources :sessions, only: [:new, :create, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
