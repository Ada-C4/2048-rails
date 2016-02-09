Rails.application.routes.draw do
  root 'site#index'

  get '/auth/facebook/callback' => 'sessions#create'
  get 'auth/failure' => '/'
  get 'signout' => 'sessions#destroy'

  post 'save' => 'games#save'
end
