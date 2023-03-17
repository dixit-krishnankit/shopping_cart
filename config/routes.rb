Rails.application.routes.draw do
  root "main#index"

  get "signup", to: "signup#new"
  post "signup", to: "signup#create"

  get "signin", to: "sessions#new"
  post "signin", to: "sessions#create"

  get "logout", to: "sessions#destroy"

  get "password", to: "password#edit"
  patch "password", to: "password#update"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
