Rails.application.routes.draw do

  get 'sessions/new'

  get 'users/new'

  root 'static_pages#home'
  
  get '/help', to: 'static_pages#help'
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  
  # Login stuff
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
  # Search
  get '/search', to: 'travel_packages#search'
  get '/searchresults', to: 'travel_packages#searchresults'
  
  resources :users
  resources :messages
  resources :travel_packages
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
