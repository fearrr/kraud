Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  resources :actions
  resources :tidings
  resources :abouts, :only => [:index, :edit, :update]
  resources :contacts, :only => [:index, :edit, :update]
  root 'static#index'

end
