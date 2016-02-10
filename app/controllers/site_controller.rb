class SiteController < ApplicationController

  def index
    current_user
    if @current_user
      @games = @current_user.games
    else
      @games = []
    end
  end

  # def games
  #   current_user
  #
  #   @games = @current_user.games
  # end
end
