class GamesController < ApplicationController
  def save
    render :json => {"a": "apple"}.as_json, status: :ok
  end

  def state
    game = Game.find(params[:id])
    render :json => game.state.as_json, status: :ok
  end
end
