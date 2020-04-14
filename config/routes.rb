Rails.application.routes.draw do
  devise_for :users
  
  root "items#index"
  resources :users, only: [:edit, :update,:destroy]
  resources :items do
    resources :comments
  end
end
