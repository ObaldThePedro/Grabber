Rails.application.routes.draw do
  
  get 'grabber', to:'users#grabber', as: :grabber
  get 'welcome/:id', to:'users#welcome', as: :welcome
  get 'signup', to:'users#new'
  get 'login', to:'sessions#new'
  post 'login', to:'sessions#create'
  get 'logout', to: 'sessions#destroy', as: 'logout'
  get 'my_items', to: 'users#my_items', as: 'my_items'
  get 'my_bookings', to: 'users#my_bookings', as: 'my_bookings'
  get 'bookings_history', to: 'users#bookings_history', as: 'bookings_history'
  get 'create_booking', to: 'bookings#create_booking', as: 'create_booking'
  post 'return_item', to: 'bookings#return_item', as: 'return_item'
  
  resources :users
  resources :items
  resources :bookings
  resources :reviews
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
