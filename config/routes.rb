Rails.application.routes.draw do
  get 'errors/file_not_found'

  get 'errors/unprocessable'

  get 'errors/internal_server_error'

  match '/404', to: 'errors#file_not_found', via: :all
  match '/422', to: 'errors#unprocessable', via: :all
  match '/500', to: 'errors#internal_server_error', via: :all

  mount Ckeditor::Engine => '/ckeditor'

  get 'parts/kombikorm', to: redirect('roottypes/1')
  get 'parts/pellet', to: redirect('roottypes/2')

  get 'types/update_parts', as: 'update_parts'
  get 'types/:id/update_parts' => 'types#update_parts'

  get 'items/update_types', as: 'update_types'
  get 'items/update_parts' => 'types#update_parts'
  get 'items/:id/update_types' => 'items#update_types'
  get 'items/:id/update_parts' => 'types#update_parts'

  get 'roottypes_order' => 'roottypes#order', as: 'roottypes_order'
  get 'parts_order' => 'parts#order', as: 'parts_order'
  get 'types_order' => 'types#order', as: 'types_order'
  get 'items_order' => 'items#order', as: 'items_order'

  get 'roottypes/:id/up_order' => 'roottypes#up_order', as: 'roottypes_up_order'
  get 'roottypes/:id/down_order' => 'roottypes#down_order', as: 'roottypes_down_order'

  get 'parts/:id/up_order' => 'parts#up_order', as: 'parts_up_order'
  get 'parts/:id/down_order' => 'parts#down_order', as: 'parts_down_order'

  get 'types/:id/up_order' => 'types#up_order', as: 'types_up_order'
  get 'types/:id/down_order' => 'types#down_order', as: 'types_down_order'

  get 'items/:id/up_order' => 'items#up_order', as: 'items_up_order'
  get 'items/:id/down_order' => 'items#down_order', as: 'items_down_order'

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
  resources :roottypes
  root 'static#index'

  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  get '/publish_item/:id', to: 'items#publish', as: 'publish_item'
  get '/dublicate/:id', to: 'items#dublicate', as: 'dublicate'

  get '/destroy_item_asset/:item_id/:asset_id', to: 'items#destroy_asset', as: 'destroy_item_asset'
  get '/destroy_photogal_asset/:photogal_id/:asset_id', to: 'photogals#destroy_asset', as: 'destroy_photogal_asset'
  get '/destroy_about_asset/:asset_id', to: 'abouts#destroy_asset', as: 'destroy_about_asset'
end
