Rails.application.routes.draw do

  root 'site#index'
  get '/auth/facebook/callback' => 'sessions#create'
end
