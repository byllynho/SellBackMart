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
  
 

  get 'items', to: 'users#open_page', as: 'open_page'
  
  get 'users/my_profile', to: 'users#my_profile', as: 'my_profile'
  get 'users/:id', to: 'users#show', as: 'user'
  get 'users', to: 'users#index', as: 'users'
  
  
end
