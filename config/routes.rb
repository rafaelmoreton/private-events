Rails.application.routes.draw do
  devise_for :users
  post 'invitations', to: 'invitations#create'
  post 'events', to: 'events#create'
  get 'events/new', to: 'events#new'
  get 'events/index', to: 'events#index'
  get 'events/:id', to: 'events#show', as: :event
  delete 'events/:id', to: 'events#destroy', as: :event_destroy
  get 'events/:id/edit', to: 'events#edit', as: :event_edit
  patch 'events/:id', to: 'events#update'
  get 'users/:id', to: 'users#show', as: :user
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "events#index"
end
