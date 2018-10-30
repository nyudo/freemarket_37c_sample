Rails.application.routes.draw do
  root 'items#index'
  get "users" => "users#index"
  resources :users, only: [:index, :edit, :update,:show]
  resources :items, only: [:new, :create, :edit, :update]
  post "item/create" => "item/create"
end

