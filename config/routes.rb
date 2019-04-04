Rails.application.routes.draw do
  
  devise_for :users, controllers: 
  { confirmations: 'users/confirmations',
    passwords: 'users/passwords', 
    registrations: 'users/registrations' ,
    sessions: 'users/sessions'
  }
  
  root to: 'pages#home'

  get 'items', to: 'users#open_page', as: 'open_page'
  
end
