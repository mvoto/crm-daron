Rails.application.routes.draw do
  resources :customers
  root to: 'customers#index'
end
