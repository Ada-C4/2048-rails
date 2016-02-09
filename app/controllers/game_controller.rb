class GameController < ApplicationController

  def save
# does the game exist or do we need to create a new one?
    game = Game.new
    game.score = 2048 #something we get from JS
    game.board_state = "" #some kind of sting
    game.lost = false
  end
end
