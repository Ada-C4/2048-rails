class GamesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def save
    # binding.pry
    @game = Game.new(
      gamestate: params,
      score: params["score"],
      over: params["over"],
      won: params["won"],
      keepplaying: params["keepPlaying"]
    )
    @game.save
    current_user.games << @game

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
