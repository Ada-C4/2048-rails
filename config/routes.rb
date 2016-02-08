Rails.application.routes.draw do

  root "site#index"
  get "/auth/facebook"
  get "/auth/facebook/callback", to: "sessions#create"
  get "signout", to: "sessions#destroy" 

end
