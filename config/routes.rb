Rails.application.routes.draw do
  root to: 'items#index'
  devise_for :users
  resources :items
  resources :purchase_records, only: [:index, :new, :create]
end
