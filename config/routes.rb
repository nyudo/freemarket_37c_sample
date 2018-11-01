Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions'
  }

  devise_scope :user do
    post 'users/confirm' => 'users/registrations#confirm'
    post 'users/complete' => 'users/registrations#complete'
  end

  root 'items#index'
  get "users" => "users#index"
  get "users/in_progress" => "users#in_progress"
  get "users/completed" => "users#completed"
  get "users/purchase" => "users#purchase"
  get "users/purchased" => "users#purchased"
  resources :users, only: [:index, :edit, :update,:show]
  resources :items, only: [:new, :create, :edit, :update]
  post "item/create" => "item/create"
end
