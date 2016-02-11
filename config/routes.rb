Rails.application.routes.draw do

  get '/auth/:provider/callback', to: "sessions#create"

  post '/logout', to: "sessions#destroy"

  root "site#index"

  post '/game' => "game#update", as: :update

  get '/game' => "game#new", as: :new

<<<<<<< HEAD
  post 'game/show' => "game#show", as: :show_games
=======
  post '/game/:id' => "game#load", as: :load
>>>>>>> fe3cb4f44b5eb75307b32735bf1c2e631fd97715
end
