Rails.application.routes.draw do

  root "site#index"
  get "/auth/facebook"
  get "/auth/facebook/callback" to: "sessions#create"
end
