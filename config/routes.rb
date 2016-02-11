Rails.application.routes.draw do

  get '/auth/:provider/callback', to: "sessions#create"

  post '/logout', to: "sessions#destroy"

  root "site#index"

  post '/game' => "game#update", as: :update

  get '/game' => "game#new", as: :new

  get '/games' => "game#show", as: :show

  post '/game/:id' => "game#load", as: :load
end
