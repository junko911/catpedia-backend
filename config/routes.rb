Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create, :index]
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'
      resources :users do
        member do
          post 'follow'
          delete 'unfollow'
        end
      end
    end
  end

  resources :breeds
  resources :cats
  
  get '/categories', to: 'cats#categories'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
