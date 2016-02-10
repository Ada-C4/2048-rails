Rails.application.routes.draw do

  root "site#index"
  get "/auth/facebook"
  get "/auth/facebook/callback", to: "sessions#create"
  get "signout", to: "sessions#destroy"
  get "/saved-games", to: "site#games"  #move to game#index
  post "save", to: "game#save"
  # get "get-game", to: "game#get_game"
  resources :users do
    resources :game do
    end
  end





end
