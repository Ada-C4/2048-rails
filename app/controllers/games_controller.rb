class GamesController < ApplicationController
  def new
    unless current_user.nil?
      game = Game.create(params[:state])
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
      game.update(state: game_params)
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

  def game_params
    params.require(:state)
  end
end
