Rails.application.routes.draw do
  devise_for :users

  root "posts#index"

  # get "/", to: "posts#index"
  # get "/posts/:id", to: "posts#show"

  resources :posts
  
  # get "/", to: "posts#index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
