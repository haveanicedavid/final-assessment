Rails.application.routes.draw do

  resources :tasks #, only: [:index, :create, :destroy, :update]
  resources :lists #, only: [:index, :create, :destroy, :update]

  root 'lists#index'

end
