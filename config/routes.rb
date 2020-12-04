Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :buddies do
    get 'bookings/checkout', to: "bookings#checkout", as: :checkout
    resources :bookings, only: [:new, :create, :index, :show, :destroy]
end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

