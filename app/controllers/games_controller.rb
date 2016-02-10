class GamesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def save
    @game = Game.new(
      gamestate: params,
      score: params["score"],
      over: params["over"],
      won: params["won"],
      keepplaying: params["keepPlaying"],
    )
    @game.user_id = current_user.id
    @game.save

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
