class SiteController < ApplicationController

  def index
    current_user
  end

  def games
    current_user
    @games = @current_user.games
  end
end
