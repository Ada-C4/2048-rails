class GamesController < ApplicationController
  before_action :all_games, only: [:index, :create]
  respond_to :html, :js
  skip_before_action :verify_authenticity_token

  def get_user
    @current_user = current_user
    render json: @current_user

  end

  def retrieve_game
    respond_to do |format|
      format.json do
        id = params[:id]
        @result = Game.find(id)
        render json: @result
      end
    end
  end

  def create_game
    respond_to do |format|
      format.json do
        # user_id = params[:UserId]
        state = params[:state]
        game = Game.new
        game.state = state
        game.user_id = @current_user.id
        game.save
        render json: game
      end
    end
  end

end
