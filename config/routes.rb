Rails.application.routes.draw do

  mount Ckeditor::Engine => '/ckeditor'

  get 'types/update_parts', as: 'update_parts'
  get 'types/:id/update_parts' => 'types#update_parts'

  get 'items/update_types', as: 'update_types'
  get 'items/update_parts' => 'types#update_parts'
  get 'items/:id/update_types' => 'items#update_types'
  get 'items/:id/update_parts' => 'types#update_parts'


  get 'parts/kombikorm', as: 'kombikorm'
  get 'parts/pellet', as: 'pellet'
  post 'callbacks/fast_callback'
  post 'callbacks/slow_callback'
  patch 'callbacks/slow_callback'
  patch 'callbacks/fast_callback'

  resources :admins
  resources :actions
  resources :tidings
  resources :parts
  resources :types
  resources :items
  resources :comments
  resources :captions
  resources :sliders
  resources :uploads
  resources :abouts, :only => [:index, :edit, :update]
  resources :mains, :only => [:index, :edit, :update]
  resources :contacts, :only => [:index]
  resources :globals
  resources :photogals
  root 'static#index'

  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'

  get   '/publish_item/:id', to: 'items#publish', as: 'publish_item'
  get   '/dublicate/:id', to: 'items#dublicate', as: 'dublicate'

  get   '/destroy_item_asset/:item_id/:asset_id', to: 'items#destroy_asset', as: 'destroy_item_asset'
  get   '/destroy_photogal_asset/:photogal_id/:asset_id', to: 'photogals#destroy_asset', as: 'destroy_photogal_asset'
  get   '/destroy_about_asset/:asset_id', to: 'abouts#destroy_asset', as: 'destroy_about_asset'
end
