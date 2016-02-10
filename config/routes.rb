Rails.application.routes.draw do
  root 'site#index'

  get '/auth/facebook/callback' => 'sessions#create'
  get 'auth/failure' => '/'
  get 'signout' => 'sessions#destroy'

  post 'save' => 'games#save'
  get 'games/:id' => 'games#state', as: :state
  get 'users' => 'users#current_user'
  get 'users/:id' => 'users#last_game'
end
