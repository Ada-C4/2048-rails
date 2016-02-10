Rails.application.routes.draw do
  root 'site#index'

  get '/auth/facebook/callback' => 'sessions#create'
  get 'auth/failure' => '/'
  get 'signout' => 'sessions#destroy'

  post 'save' => 'games#save'
  get 'games/:id' => 'games#state', as: :state
  # get 'users' => 'users#current_user'
  get 'users' => 'users#last_game'
  get 'users/:id/games' => 'users#games', as: :user_games
end
