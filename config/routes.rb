Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :trips
  resources :reviews

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"
  get '/home/sad', to: 'home#sad'
  get '/dashboard/my_trips', to: 'users#show_my_trips', as: 'my_trips'
  get '/trips/:id/reviews', to: 'trips#show_reviews', as: 'show_trip_reviews'
  get '/home/search_trips', to:'trips#show_search_trips', as: 'show_search_trips'

end
