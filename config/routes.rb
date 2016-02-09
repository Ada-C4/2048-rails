Rails.application.routes.draw do
  root "site#index"
  
  match "/auth/:provider/callback", to: "sessions#create", via: [:get, :post]
  get '/logout' => 'sessions#destroy'

  get '/users/:id' => 'users#show'

  #match "games_api" => "users#games_api", via: [:get, :post]
  get "retrieve_game" => "users#retrieve_game"
  post "create_game" => "users#create_game"
end
