Rails.application.routes.draw do
  root 'site#index'

  get '/auth/facebook/callback' => 'sessions#create'
  get 'auth/failure' => '/'
  get 'signout' => 'sessions#destroy'

  post 'save/:id' => 'games#save'
  get 'new' => 'games#new'
  get 'games/:id' => 'games#state', as: :state
  delete 'games/:id' => 'games#destroy', as: :delete_game
  # get 'users' => 'users#current_user'
  get 'users' => 'users#last_game'
  get 'users/:id/games' => 'users#games', as: :user_games
  get 'leaderboard' => 'users#leaderboard', as: :leaderboard

end
