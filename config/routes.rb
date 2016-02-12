Rails.application.routes.draw do
  #root "site#index"
  root "site#index"

  match "/auth/:provider/callback", to: "sessions#create", via: [:get, :post]
  get '/logout' => 'sessions#destroy'

  get '/users/:id' => 'users#show', as: :user_show

  #match "games_api" => "users#games_api", via: [:get, :post]
  #get "/users/:id/retrieve_game" => "games#retrieve_game", as: :retrieve_game
  post "/create_game" => "games#create_game", as: :create_game
  #get "/games/get_user" => "games#get_user"
  get "/game" => "site#index", as: :game_home

  get "/load_games" => "games#load_games", as: :load_games
  get "/retrieve_game" => "games#retrieve_game", as: :retrieve_game
  get "/get_user" => "games#get_user", as: :get_user
  post "/set_score" => "games#set_score", as: :get_score
  get "/report_score" => "games#report_score", as: :report_score

end
