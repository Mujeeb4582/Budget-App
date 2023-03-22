Rails.application.routes.draw do
  get 'categories/index'
  devise_for :users
  resources :users, only: [:index]
  resources :categories, only: [:index, :show, :new, :create]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "users#index"
end
