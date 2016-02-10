class GamesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @games = current_user.games.order(:created_at).reverse
  end

  def show
    #this is the method that will do something to game manager and make
    #game manager do a get call, and this method will render the json
  end


  def save
    @game = Game.new(
      gamestate: params,
      score: params["score"],
      over: params["over"],
      won: params["won"],
      keepplaying: params["keepPlaying"],
    )
    current_user.games << @game
    @game.user_id = current_user.id
    @game.save

    render json: [], status: 200
  end

  def update
    @games = Game.update(game_params)
    @game.save
  end

  def destroy
    id = params[:id]
    Game.destroy(id)
    redirect_to games_path
  end

  def leaderboard
    @games = Game.all.order(score: :desc)
  end

end
