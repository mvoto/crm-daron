Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    get '/login' => 'devise/sessions#new'
    get '/logout' => 'devise/sessions#destroy'
  end

  namespace :admin do
    resources :users
  end

  resources :customers
  resources :devices, only: [:new, :create, :edit, :update, :destroy]
  get 'state', to: 'states#show'

  root to: 'customers#index'
end
