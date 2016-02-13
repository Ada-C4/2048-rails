class GameController < ApplicationController

  def save
# does the game exist or do we need to create a new one?
    game = Game.new
    game.score = params[:score] #something we get from JS
    game.board_state = params[:board_state] #some kind of string
    game.lost = params[:lost]
    game.user_id = current_user.id
    game.save
    render :json => [], :status => :ok
  end

  def show
    respond_to do |format|
      format.json {
        game = Game.find_by(id: params[:id])
        if game
          render :json => game.as_json(except: [:created_at, :updated_at]), :status => :ok
        else
        # the request itself was fine, but there was just no content associated with the response, so use status code 204
          render :json => [], :status => 204
        end
      }
      format.html {
        @user_id = current_user.id
        @game_id = params[:id]
        render template: "site/index"
      }
    end
  end


  def index
    @username = current_user.name
    @games = current_user.games
  end

end
