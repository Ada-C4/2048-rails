class UsersController < ApplicationController
  def games_api
    respond_to do |format|
      format.json do
        id = params[:id]
        @result = Game.find(id)
        render json: @result
      end
    end
  end
end
