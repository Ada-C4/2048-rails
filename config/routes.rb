Rails.application.routes.draw do

  get '/auth/:provider/callback', to: "sessions#create"

  post '/logout', to: "sessions#destroy"

  root "site#index"

  post '/game' => "game#update", as: :update

  get '/game' => "game#new", as: :new

  post 'game/show' => "game#show", as: :show_games
end
