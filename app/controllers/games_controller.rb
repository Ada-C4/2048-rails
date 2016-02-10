class GamesController < ApplicationController
  def save
    render :json => {"a": "apple"}.as_json, status: :ok
  end

  def state
    game = Game.find_by(id: params[:id])
    unless game.nil?
      render :json => game.state, status: :ok
    else
      render :json => [], status: :no_content
    end
  end
end
