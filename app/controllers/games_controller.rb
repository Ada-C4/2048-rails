class GamesController < ApplicationController

  def save
    @game = Game.new(
    gamestate: params,
    score: params["score"],
    over: params["over"],
    won: params["won"],
    keepplaying: params["keepPlaying"])
    @game.save
    @current_user.games << @game
    render json: [], status: 200
  end

  def update
    @games = Game.update(game_params)
    @game.save
  end

  def destroy
    @game.destroy
  end

end
