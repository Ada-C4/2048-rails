class SiteController < ApplicationController

  def index
  	if session[:user_id]
  		user = User.find(session[:user_id])
  		@games = user.games
  	end
  end
end
