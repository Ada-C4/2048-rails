Rails.application.routes.draw do
  root "site#index"
  match "/auth/:provider/callback", to: "sessions#create", via: [:get, :post]
  get '/logout' => 'sessions#destroy'
  match "games_api" => "users#games_api", via: [:get, :post]
  get '/games' => 'site#games'
end
