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

  #get 'items', to: 'items#index', as: 'items'
  post 'items', to: 'items#create'

  post 'messages', to: 'messages#send_message', as: 'send_message'
  post 'messages/send_messages_ajax', to: 'messages#send_messages_ajax', as: 'send_messages_ajax'
  get 'messages/get_messages_from_user', to: 'messages#get_messages_from_user', as: 'get_messages_from_user'
  get 'messages', to: 'messages#index', as: 'messages'
  post 'check_messages', to: 'messages#check_messages', as: 'check_messages'
  
  #get 'reviews', to: 'reviews#index', as: 'reviews'
  post 'reviews', to: 'reviews#create', as: 'reviews'
  get 'reviews/view_review_:id/edit', to:'reviews#edit', as:'edit_review'
  patch 'reviews/view_review_:id', to:'reviews#update', as:'review'
  put 'reviews/view_review_:id', to:'reviews#update'
  delete 'reviews/view_review_:id', to:'reviews#destroy'

  get 'items/new', to:'items#new', as:'post_new_item'
  get 'users/:user_id/reviews/new', to:'reviews#new', as:'post_new_review'

  #get 'reviews/view_review_:id', to:'reviews#view_review', as:'review'

  get 'items/view_item_:id/edit', to:'items#edit', as:'edit_item'

  patch 'items/view_item_:id', to:'items#update'
  put 'items/view_item_:id', to:'items#update'

  #get 'items/:id', to: 'items#show', as: 'show_item'

  get 'items/view_item_:id', to: 'items#view_item', as: 'item'
  get 'catalog', to: 'items#catalog', as: 'catalog'
  get 'filter', to: 'items#filter', as: 'filter'  
  post 'comment', to: 'items#comment', as: 'comment'
  post 'respond', to: 'items#respond', as: 'respond'
  
  delete 'items/view_item_:id', to:'items#destroy'
  delete 'pictures/view_item_:id', to:'pictures#destroy', as:'picture'

  get 'open_page', to:'users#open_page', as:'open_page'
  get 'users/my_profile/edit', to: 'users#edit', as: 'edit_my_profile'

  patch 'users/:id', to:'users#update'

  #put 'users/:id', to:'users#update'

  get 'users/my_profile', to: 'users#my_profile', as: 'my_profile'
  get 'users/:id', to: 'users#show', as: 'user'
  get 'users', to: 'users#index', as: 'users'




  get 'users/my_profile/watchlist', to: 'watchlists#show', as: 'watchlist'
  post 'users/my_profile/watchlist', to: 'watchlists#create'

  get 'users/my_profile/watchlist/watch_items', as:'watch_items'
  get 'users/my_profile/watchlist/watch_items/new', to:'watch_items#new', as:'add_new_watch_item'
  post 'users/my_profile/watchlist/watch_items', to: 'watch_items#create'
  #post 'users/my_profile/watchlist/watch_items/new', to:'watch_items#new'
  
  

  get 'users/my_profile/watchlist/watch_items/:id', to:'watch_items#show', as:'watch_item'

  get 'users/my_profile/watchlist/watch_items/:id/edit', to:'watch_items#edit', as:'edit_watch_item'

  patch 'users/my_profile/watchlist/watch_items/:id', to:'watch_items#update'
  put 'users/my_profile/watchlist/watch_items/:id', to:'items#update'
  delete 'users/my_profile/watchlist/watch_items/:id', to:'watch_items#destroy', as: 'delete_watch_item'


  get '*path', to: 'pages#bad_url'

#  get 'reviews', to: 'reviews#index', as: 'reviews'
#  post 'reviews', to: 'reviews#create'
  

#  get 'reviews/:id/edit', to:'reviews#edit', as:'edit_review'

#  patch 'reviews/view_review_:id', to:'reviews#update'
#  put 'reviews/view_review_:id', to:'reviews#update'

#  get 'reviews/view_review_id', to:'reviews#view_review', as:'review'

end
