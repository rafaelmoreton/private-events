Rails.application.routes.draw do
  devise_for :users
  get 'events/index', to: 'events#index'
  get 'users/:id', to: 'users#show'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "events#index"
end
