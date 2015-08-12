Rails.application.routes.draw do

  resources :tasks, only: [:new, :create, :destroy, :update, :edit, :show]
  resources :lists, only: [:index, :new, :create, :destroy, :update, :edit, :show]

  delete 'tasks/image/delete', to: 'tasks#delete_image'

  root 'lists#index'

end
