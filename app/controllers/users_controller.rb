class UsersController < ApplicationController
  respond_to :html, :js
  skip_before_action :verify_authenticity_token

  def show
    current_user
    @games = Game.where(user_id: @current_user.id)
  end

  # def games_api
  #   respond_to do |format|
  #     format.json do
  #       id = params[:id]
  #       @result = Game.find(id)
  #       render json: @result
  #     end
  #   end
  # end

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
        user_id = params[:user_id]
        state = params[:state]
        game = Game.new
        game.state = state
        game.user_id = user_id
        game.save
        render json: game
      end
    end
  end
end
