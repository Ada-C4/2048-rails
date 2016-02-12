class SiteController < ApplicationController

  def index
    if current_user
      @username = current_user.name
    end
    if params[:id]

    end
  end

  def games
    @username = current_user.name
    @games = current_user.games
  end

  def leaderboard
    @games = Game.order(score: :desc).limit(10)
  end

  def tictactoe
    
  end
end
