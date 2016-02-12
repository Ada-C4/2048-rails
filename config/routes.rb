Rails.application.routes.draw do

  get '/auth/:provider/callback', to: "sessions#create"

  post '/logout', to: "sessions#destroy"

  root "site#index"

  post '/game' => "game#update", as: :update

  get '/game' => "game#new", as: :new

  get '/games' => "game#show", as: :show

  get '/topgames' => "game#top", as: :topgames

  post '/game/:id' => "game#load", as: :load

  delete '/game/:id' => "game#destroy", as: :delete

end
