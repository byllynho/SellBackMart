Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'pages#home' 
  get 'home', to: 'pages#home', as: 'home'
  get 'about', to: 'pages#about', as: 'about'
  
  devise_for :users, controllers: 
  { confirmations: 'users/confirmations',
    passwords: 'users/passwords', 
    registrations: 'users/registrations' ,
    sessions: 'users/sessions'
  }
  
 

  get 'home', to: 'pages#home', as: 'home'
  get 'about', to: 'pages#about', as: 'about'

  get 'items', to: 'items#index', as: 'items'
  post 'items', to: 'items#create'

  get 'items/new', to:'items#new', as:'post_new_item'

  get 'items/:id/edit', to:'items#edit', as:'edit_item'

  get 'items/:id', to:'items#show', as:'item'
  patch 'items/:id', to:'items#update'
  put 'items/:id', to:'items#update'
  
  delete 'items/:id', to:'items#destroy'
  get 'open_page', to:'users#open_page', as:'open_page'
  get 'users/my_profile', to: 'users#my_profile', as: 'my_profile'
  get 'users/:id', to: 'users#show', as: 'user'
  get 'users', to: 'users#index', as: 'users'
  
  
end
