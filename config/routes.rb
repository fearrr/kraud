Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  resources :actions
  resources :tidings
  root 'static#index'

end
