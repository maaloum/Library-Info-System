Rails.application.routes.draw do
  devise_for :users
  root 'home#index'
  get 'book/list', to: 'book#list'
  # get 'book/new'
  # post 'book/create'
  # patch 'book/update', to: 'book#update'
  # # get 'book/show'
  # get 'book/:id/edit', to: 'book#edit'

  delete '/book/:id', to: 'book#destroy'
  resources :book
  resources :subject
  get 'subject/index'
  get 'book/show_subjects/:id', to: 'subject#show_subjects', as: 'book_show_subjects'

end
