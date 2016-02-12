class GamesetupsController < ApplicationController
  skip_before_action :verify_authenticity_token
  skip_before_action :require_user

  def index
    @games = @current_user.gamesetups
  end

  def show
    game = Gamesetup.find(params[:id])
    render :json => game.as_json,
    :status => :ok
  end

  def create
    game = Gamesetup.new()
    game.size = grid_params[:size]
    game.score = game_params[:score]
    game.over = game_params[:over]
    game.won = game_params[:won]
    game.keepPlaying = game_params[:keepPlaying]
    game.json_cells = grid_params[:cells]
    game.user_id = @current_user.id
    game.save
    redirect_to root_path
  end

  def destroy
    @game = Gamesetup.find(params[:id])
    @game.destroy
    flash[:notice] = "Game successfully destroyed"
    redirect_to gamesetups_path
  end

  def update
  end


  private

  def grid_params
    params.require(:grid).permit(:cells, :size)
  end
  def game_params
    params.permit(:score, :over, :won, :keepPlaying)
  end
end
