Rails.application.routes.draw do

  root "site#index"
  post 'users' => 'users#create'
  get 'login' => 'sessions#new'
  delete 'logout' => 'sessions#destroy'
  get "/auth/:provider/callback" => 'sessions#create', as: :auth
end
