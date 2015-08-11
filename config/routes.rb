Rails.application.routes.draw do

  resources :tasks, only: [:new, :create, :destroy, :update, :edit, :show]
  resources :lists, only: [:index, :new, :create, :destroy, :update, :edit, :show]

  root 'lists#index'

end
