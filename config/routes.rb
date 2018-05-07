Rails.application.routes.draw do

  root 'pages#home'


  resources :profiles

  resources :services do 
    resources :bookings
  end
  
  resources :bookings
  devise_for :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
