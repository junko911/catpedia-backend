Rails.application.routes.draw do
<<<<<<< HEAD
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create]
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'
    end
  end
=======
  resources :breeds
  resources :cats
>>>>>>> Create cat/breed model/controller
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
