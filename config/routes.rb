Rails.application.routes.draw do
  devise_for :users, :controllers => { omniauth_callbacks: 'omniauth_callbacks', registrations: 'registrations' }

  resources :orders, only: [:index, :new, :show, :create]
  resources :books, only: [:index, :show]
  resources :carts
  resources :checkout

  #get 'checkout/:id', to: 'checkout#show', id: [:address, :delivery, :payment, :confirm, :complete]

  root 'static_pages#index'

  get '*path', to: 'static_pages#index'

end
