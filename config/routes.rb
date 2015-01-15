Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  resources :actions
  resources :tidings
  root 'static#index'

  get 'about' => 'static#about'
  get 'contact' => 'static#contact'

end
