class GamesController < ApplicationController
  def new
    unless current_user.nil?
      game = Game.create(state: params[:state], score: 0, won: false, completed: false)
      current_user.games << game
      current_user.save
      render :json => { id: game.id }.as_json, status: :ok
    else
      render :json => [], status: :no_content
    end
  end

  def save
    game = Game.find_by(id: params[:id])
    unless game.nil?
      game.update(
        state: game_params[:state],
        score: game_params[:score],
        won: game_params[:won],
        completed: game_params[:completed]
        )
      render :json => params.as_json, status: :ok
    else
      render :json => [], status: :no_content
    end
  end

  def state
    game = Game.find_by(id: params[:id])
    unless game.nil?
      render :json => game.state, status: :ok
    else
      render :json => [], status: :no_content
    end
  end

  def destroy
    game = Game.find(params[:id])
    user_id = User.find(game.user_id)
    game.destroy
    redirect_to user_games_path(id: user_id)
  end

  def game_params
    params.permit(:state, :won, :completed, :score)
  end
end
