Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/dashboard', to: 'bookings#dashboard'
  get '/bookings/:id/accepted', to: 'bookings#accepted', as: :accepted
  resources :buddies do
    resources :reviews, only: :create
    get 'bookings/checkout', to: "bookings#checkout", as: :checkout   
    resources :bookings, only: [:new, :create, :index, :show ]
    
  end
resources :bookings, only: [:destroy]
resources :chatrooms, only: :show do
  resources :messages, only: [:new, :create]
end
end

