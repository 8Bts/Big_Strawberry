Rails.application.routes.draw do
  resources :articles

  resources :users, only: [:new, :create, :show]
  
  resources :sessions, only: [:new, :create, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
