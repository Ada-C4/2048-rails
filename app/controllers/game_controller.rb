class GameController < ApplicationController
	skip_before_action :verify_authenticity_token

  def new
    session[:game_id] = nil
    render :json => []
  end

	#update the status of a game to wong or lost, or save an ongoing game
	def update
	  if session[:game_id]
      # update game
      game = Game.find(session[:game_id])
	  	game.update(gamestate: params[:gamestate], game_over: JSON.parse(params[:gamestate])["over"], score: JSON.parse(params[:gamestate])["score"])
	  else
	  	# create game
	  	game = Game.create(user_id: session[:user_id], gamestate: params[:gamestate], game_over: JSON.parse(params[:gamestate])["over"], score: JSON.parse(params[:gamestate])["score"])
	  	# add new game id to the session
	  	session[:game_id] = game.id
	  end
	  render :json => game, status: :ok
	end

	# load a saved game
	def load
		game = Game.find(params[:id])
		render :json =>  { gamestate: game.gamestate, score: game.score, status: :ok }
	end

	#delete an ongoing game


end
