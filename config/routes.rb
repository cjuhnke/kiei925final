Rails.application.routes.draw do

  get "/" => 'recipes#index'
  
  get "/login" => "sessions#new"
  get "/sessions/create" => 'sessions#create'
  get "/logout" => "sessions#destroy"
  
  get "/recipes" => "recipes#index"
  get "/recipes/new" => "recipes#new"
  get "/recipes/create" => "recipes#create"
  get "/recipes/:id/delete" => "recipes#destroy"
  get "/recipes/:id/edit" => "recipes#edit"
  get "/recipes/:id/update" => "recipes#update"
  get "/recipes/:id" => "recipes#show"

  get "/users" => "users#index"
  get "/users/new" => "users#new"
  get "/users/create" => "users#create"
  get "/users/:id/delete" => "users#destroy"
  get "/users/:id/edit" => "users#edit"
  get "/users/:id/update" => "users#update"
  get "/users/:id" => "users#show"
  

  get "/reviews/:id/create" => "reviews#create"
  get "/reviews/:id/new" => "reviews#new"
  get "/reviews/:id/delete" => "reviews#destroy"
  get "/reviews/:id/edit" => "reviews#edit"
  get "/reviews/:id/update" => "reviews#update"

end
