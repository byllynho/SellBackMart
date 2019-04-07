Rails.application.routes.draw do
  
  devise_for :users, controllers: 
  { confirmations: 'users/confirmations',
    passwords: 'users/passwords', 
    registrations: 'users/registrations' ,
    sessions: 'users/sessions'
  }
  
  root to: 'pages#home'

  get 'home', to: 'pages#home', as: 'home'
  get 'view_item_:id', to: 'items#view_item', as: 'item'
  get 'items', to: 'users#open_page', as: 'open_page'
  get 'catalog', to: 'items#catalog', as: 'catalog'
  get 'filter', to: 'items#filter', as: 'filter'
  post 'comment', to: 'items#comment', as: 'comment'
end
