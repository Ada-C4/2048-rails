Rails.application.routes.draw do

  root "site#index"
  get "/auth/facebook"
  get "/auth/facebook/callback", to: "sessions#create"
  get "signout", to: "sessions#destroy"
  get "/leaderboard", to: "site#leaderboard"
  get "/tictac", to: "site#tictactoe"
  post "save", to: "game#save"
  resources :users do
    resources :game do
    end
  end
end
