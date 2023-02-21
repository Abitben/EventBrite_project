Rails.application.routes.draw do

  root 'events#index'

  get 'static_pages/index'
  get 'static_pages/secret'

  resources :events
  

  devise_for :users
  get 'users/:id' => 'users#show', as: :user
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
end
