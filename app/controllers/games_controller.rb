class GamesController < ApplicationController

  def create
    @game = Game.new(game_params)
    @game.save
    @current_user.games << @game
  end

  def update
    @games = Game.update(game_params)
    @game.save
  end

  def destroy
    @game.destroy
  end


  private

  def game_params
    params.permit(game:[:gamestate, :score, :over, :won, :keepplaying])
  end

end
