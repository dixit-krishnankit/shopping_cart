Rails.application.routes.draw do
  root "main#index"
  get "admin", to: "admin#index"

  get "signup", to: "signup#new"
  post "signup", to: "signup#create"

  get "signin", to: "sessions#new"
  post "signin", to: "sessions#create"

  get "logout", to: "sessions#destroy"

  get "password", to: "password#edit"
  patch "password", to: "password#update"

  get "cart", to: "cart#index"
  post "cart", to: "cart#add_product"
  delete "cart", to: "cart#delete"

  get "product/:id/edit", to: "product#edit", as: "edit_product"
  patch "product/:id/", to: "product#update", as: "update_product"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
