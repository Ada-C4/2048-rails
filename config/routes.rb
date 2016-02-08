Rails.application.routes.draw do

  get '/auth/:provider/callback', to: "sessions#create"

  post '/logout', to: "sessions#destroy"

  root "site#index"
end
