Rails.application.routes.draw do

  get '/', to: 'pages#home'
  root 'pages#home'


  resources :profiles

  resources :services
  
  resources :bookings do
    member do
      put :accept
      post 'charge'
    end
  end

  devise_for :users,  controllers: { registrations: "registrations" }

  post '/users/sign_out', to: 'pages#home'

  post '/pages/index', to: 'pages#index'
  post '/pages/index', to: 'pages#index'
  get 'pages/contact', to: 'pages#contact'



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
