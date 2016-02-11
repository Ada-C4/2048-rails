class GamesController < ApplicationController
  before_action :all_games, only: [:index, :create]
  respond_to :html, :js
  skip_before_action :verify_authenticity_token

  def get_user
    @current_user = current_user
    render json: @current_user
  end

  def set_score
    @current_user = current_user
    if @current_user
      user_id = @current_user.id
      best_score = params[:bestScore]
      user = User.find(user_id)
      user.best_score = best_score
      user.save
    end
    render json: [@current_user, user.best_score]
  end

  def report_score
    @current_user = current_user
    respond_to do |format|
      format.json do
        user_id = @current_user.id
        user = User.find(user_id)
        render json: user.best_score
      end
    end
  end

  def load_games
    respond_to do |format|
      format.json do
        user_id = params[:user_id]
        @result = Game.where(user_id: user_id)
        render json: @result
      end
    end
  end

  def retrieve_game
    respond_to do |format|
      format.json do
        id = params[:game_id]
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
