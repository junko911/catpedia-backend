Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :cats
      resources :breeds
      resources :likes
      resources :users, only: [:create, :index]
      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'
      get '/categories', to: 'cats#categories'
      post '/cat_fav', to: 'cats#cat_fav'
      get '/user_favs', to: 'cats#user_favs'
      # get 'users/:id/cats', to: 'users#cats'
      resources :users do
        member do
          get 'cats'
          post 'follow'
          delete 'unfollow'
        end
      end
    end
  end
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
