Rails.application.routes.draw do
  root "site#index"
  get '/login' => 'sessions#new'
  get '/logout' => 'sessions#destroy'
  get "/auth/:provider/callback", to:"sessions#create"
  resources :gamesetups
  get '/users' => 'users#index'
end
