Rails.application.routes.draw do

  root 'events#index'

  get 'static_pages/index'
  get 'static_pages/secret'

  resources :events do
    resources :attendances, only: [:new, :index]
  end

  get '/UIdemo', to: 'testings#demo'

  scope '/checkout' do
    post 'create', to: 'checkout#create', as: 'checkout_create'
    get 'success', to: 'checkout#success', as: 'checkout_success'
    get 'cancel', to: 'checkout#cancel', as: 'checkout_cancel'
  end

  devise_for :users
  resources :users, only: [:show]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
end
