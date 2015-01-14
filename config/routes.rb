Rails.application.routes.draw do
  resources :actions
  resources :tidings
  root 'static#index'

end
