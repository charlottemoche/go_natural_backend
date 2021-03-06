Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  namespace :api do

    get "/users/:id" => "users#show"
    post "/users" => "users#create"
    patch "/users/:id" => "users#update"
    delete "/users/:id" => "users#destroy"

    post "/sessions" => "sessions#create"

    get "/topics" => "topics#index"
    get "/topics/:id" => "topics#show"

    get "/posts" => "posts#index"
    get "/posts/:id" => "posts#show"
    post "/posts" => "posts#create"
    patch "/posts/:id" => "posts#update"
    delete "/posts/:id" => "posts#destroy"

    post "/comments" => "comments#create"
    patch "/comments/:id" => "comments#update"
    delete "/comments/:id" => "comments#destroy"

    post "/posts/:id/like" => "posts#like"
    delete "/posts/:id/like" => "posts#unlike"
  
  end
end