class GamesController < ApplicationController
  def save
    game = Game.find_by(params[:id])
    game.update(state: game_params)
    render :json => params.as_json, status: :ok
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
