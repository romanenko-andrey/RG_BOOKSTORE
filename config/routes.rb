Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: { omniauth_callbacks: 'omniauth_callbacks', registrations: 'registrations' }

  resources :orders, only: [:index, :new, :show, :create]
  resources :books, only: [:index, :show, :create]
  resources :carts
  resources :checkout

  root 'static_pages#index'

  get '*path', to: 'static_pages#index'
end
