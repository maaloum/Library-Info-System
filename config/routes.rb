Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  get 'book/list', to: 'book#list'
  delete '/book/:id', to: 'book#destroy'
  resources :book
  resources :subject
  get 'subject/index'
  get 'book/show_subjects/:id', to: 'subject#show_subjects', as: 'book_show_subjects'

end
