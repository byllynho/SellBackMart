Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'pages#home' 

  get 'home', to: 'pages#home', as: 'home'
  get 'about', to: 'pages#about', as: 'about'

  get 'items', to: 'items#index', as: 'items'
  post 'items', to: 'items#create'

  get 'items/new', to:'items#new', as:'post_new_item'

  get 'items/:id/edit', to:'items#edit', as:'edit_item'

  get 'items/:id', to:'items#show', as:'item'
  patch 'items/:id', to:'items#update'
  put 'items/:id', to:'items#update'
  
end
