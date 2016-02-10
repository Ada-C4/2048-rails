Rails.application.routes.draw do

  root "site#index"
  get "/auth/facebook"
  get "/auth/facebook/callback", to: "sessions#create"
  get "signout", to: "sessions#destroy"
  get "/saved-games", to: "site#games"
  post "save", to: "game#save"
  get "chosen-game", to: "game#chosen_game"
  get "/:id", to: "site#index"




end
