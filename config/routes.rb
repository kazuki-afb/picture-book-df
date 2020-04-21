Rails.application.routes.draw do
  devise_for :users
  
  root "items#index"
  resources :users, only: [:edit, :update,:destroy]
  resources :items do
    resources :comments, only: [:index, :new, :create]
  end
  resources :images, only: [:new, :create]
end
