class SiteController < ApplicationController

  def index
    # binding.pry
    game = Game.find_by(id: params[:game_id])
    game.touch unless game.nil?
  end
end
