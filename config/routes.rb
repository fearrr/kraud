Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  get 'items/update_types', as: 'update_types'
  get 'types/kombikorm', as: 'kombikorm'
  get 'types/pellet', as: 'pellet'
  post 'callbacks/fast_callback'

  resources :actions
  resources :tidings
  resources :types
  resources :items
  resources :comments
  resources :abouts, :only => [:index, :edit, :update]
  resources :contacts, :only => [:index, :edit, :update]
  root 'static#index'

end
