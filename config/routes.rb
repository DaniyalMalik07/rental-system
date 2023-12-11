Rails.application.routes.draw do
  resources :leases
  resources :users
  resources :properties
  get 'dashboard/index'
  devise_for :admins, skip: [:registration]
  root 'dashboard#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
