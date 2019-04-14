Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'pages#home' 
  get 'home', to: 'pages#home', as: 'home'
  
  devise_for :users, controllers: 
  { confirmations: 'users/confirmations',
    passwords: 'users/passwords', 
    registrations: 'users/registrations' ,
    sessions: 'users/sessions'
  }

  get 'items', to: 'items#index', as: 'items'
  post 'items', to: 'items#create'

  get 'items/new', to:'items#new', as:'post_new_item'

  get 'items/view_item_:id/edit', to:'items#edit', as:'edit_item'

  patch 'items/view_item_:id', to:'items#update'
  put 'items/view_item_:id', to:'items#update'

  #get 'items/:id', to: 'items#show', as: 'show_item'

  get 'items/view_item_:id', to: 'items#view_item', as: 'item'
  get 'catalog', to: 'items#catalog', as: 'catalog'
  get 'filter', to: 'items#filter', as: 'filter'
  post 'comment', to: 'items#comment', as: 'comment'
  
  delete 'items/view_item_:id', to:'items#destroy'
  get 'open_page', to:'users#open_page', as:'open_page'
  get 'users/my_profile/edit', to: 'users#edit', as: 'edit_my_profile'

  patch 'users/:id', to:'users#update'
  #put 'users/:id', to:'users#update'

  get 'users/my_profile', to: 'users#my_profile', as: 'my_profile'
  get 'users/:id', to: 'users#show', as: 'user'
  get 'users', to: 'users#index', as: 'users'
  get '*path', to: 'pages#bad_url'

end
