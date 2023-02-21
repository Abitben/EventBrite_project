Rails.application.routes.draw do
  get 'users/show'

  root 'events#index'

  resources :events

  resources :users

  
  get 'static_pages/index'
  get 'static_pages/secret'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
