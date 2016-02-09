Rails.application.routes.draw do

  root "site#index"
  post 'users' => 'users#create'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  get "/auth/:provider/callback" => 'sessions#create', as: :auth
end
