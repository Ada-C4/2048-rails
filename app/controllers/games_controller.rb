class GamesController < ApplicationController
  before_action :all_games, only: [:index, :create]
  respond_to :html, :js

  # index action has been removed
  # 
  # def new
  #   @game = Game.new
  # end
  #
  # def create
  #   @game  = Game.create(game_params)
  # end
  #
  # private
  #
  #   def all_tasks
  #     @games = Game.all
  #   end
  #
  #   def game_params
  #     params.require(:game).permit(:user_id, :state)
  #   end
end
