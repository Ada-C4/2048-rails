class GameController < ApplicationController
	skip_before_action :verify_authenticity_token	

	#update the status of a game to wong or lost , or save an ongoing game
	def update
	  if session[:game_id]
	  	# update game
	  else
	  	# create game
	  	# binding.pry
	  	game = Game.new
	  	# add new game id to the session
	  end
	  render :json => game
	end

	#delete an ongoing game

end
