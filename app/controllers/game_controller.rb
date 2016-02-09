class GameController < ApplicationController

  def save
# does the game exist or do we need to create a new one?
    game = Game.new
    game.score = params[:score] #something we get from JS
    game.board_state = params[:board_state] #some kind of string
    game.lost = params[:lost]
    game.save
    render :json => [], :status => :ok
  end
end
