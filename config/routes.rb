Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  resources :actions
  resources :tidings
  resources :abouts
  root 'static#index'

  get 'contact' => 'static#contact'

end
