Rails.application.routes.draw do

  resources :tasks, only: [:new, :create, :destroy, :update, :edit, :show]
  resources :lists, only: [:index, :new, :create, :destroy, :update, :edit, :show]

  delete 'delete_image', to: 'tasks#delete_image'
  post '/update_status', to: 'tasks#update_status'

  root 'lists#index'

end
