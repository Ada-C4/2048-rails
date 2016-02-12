class SiteController < ApplicationController

  def index
    current_user
    if @current_user
      @games = @current_user.games
    else
      @games = []
    end
    @leaderboard = Game.order(score: :desc).limit(5)
  end

  # def games
  #   current_user
  #
  #   @games = @current_user.games
  # end
end
