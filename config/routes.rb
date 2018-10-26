Rails.application.routes.draw do
  root 'items#index'
  resources :users, only: [:index, :edit, :update]
  resources :items, only: [:new, :create, :edit, :update]
end
