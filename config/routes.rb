Rails.application.routes.draw do

  root 'pages#home'


  resources :profiles

  resources :services
  
  resources :bookings do
    member do
      put :accept
      post 'charge'
    end
  end


  devise_for :users

  post '/users/sign_out', to: 'pages#home'



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
