Rails.application.routes.draw do
<<<<<<< HEAD
  resources :breeds
  resources :cats
  
  get '/categories', to: 'cats#categories'
=======
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create]
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'
    end
  end
>>>>>>> 18ea163c05d8d3c8d2d0471d1b83a09f2cacd463
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
