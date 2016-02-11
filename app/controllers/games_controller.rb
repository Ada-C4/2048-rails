class GamesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    if current_user
      @games = current_user.games.order(:created_at).reverse
    end
  end

  def show
    #this is the method that will do something to game manager and make
    #game manager do a get call, and this method will render the json
    # call method in games.coffee, it will call game manager
    game = Game.find(params[:id])

    render :json => game.gamestate.as_json, :status => :ok
  end


  def save
    @game = Game.new(
      gamestate: params["data"],
      score: params["data"]["score"],
      over: params["data"]["over"],
      won: params["data"]["won"],
      keepplaying: params["data"]["keepPlaying"],
    )
    @game.user_id = current_user.id

    current_user.games << @game
    @game.save

    if @game.save
      render :json => [], status: 200
    else
      render :json => [], status: :no_content
    end
  end

  def update
    @games = Game.update(game_params)
    @game.save
  end

  def destroy
    id = params[:id]
    Game.destroy(id)
    redirect_to root_path
  end

  def leaderboard
    @games = Game.all.order(score: :desc)
  end

end
