Rails.application.routes.draw do
  root "site#index"

  match "/auth/:provider/callback", to: "sessions#create", via: [:get, :post]
  get '/logout' => 'sessions#destroy'

  get '/users/:id' => 'users#show'

  #match "games_api" => "users#games_api", via: [:get, :post]
  get "/users/:id/retrieve_game" => "users#retrieve_game", as: :retrieve_game
  post "/users/:id/create_game" => "users#create_game", as: :create_game
end
