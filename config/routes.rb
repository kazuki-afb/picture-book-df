Rails.application.routes.draw do
  devise_for :users
  
  root "items#search"
  resources :users, only: [:edit, :update,:destroy]
  resources :items do
    resources :comments, :images, only: [:index, :new, :create]
    collection do
      get 'search'
    end
  end
  resources :images, only: [:new, :create]
end
