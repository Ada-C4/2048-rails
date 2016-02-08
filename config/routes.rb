Rails.application.routes.draw do

  root "site#index"
  get 'login' => 'sessions#new'
  get "/auth/:provider/callback" => 'sessions#create', as: :auth
  post "/auth/developer/callback" => 'sessions#create', as: :developer_auth
  delete 'logout' => 'sessions#destroy'
  post 'users' => 'users#create'
  
end
