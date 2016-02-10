class UsersController < ApplicationController
  # def current_user
  #   render :json => { id: session[:user_id] }, status: :ok
  # end

  before_action :require_login, only: [:games]

  def last_game
    unless current_user.nil? || current_user.games.empty?
      render :json => { id: current_user.games.order('updated_at').last.id }, status: :ok
    else
      render :json => [], status: :no_content
    end
  end

  def games
    user = User.find(params[:id])
    if user.id != current_user.id
      flash[:error] = "You are not authorized to view this section."
      redirect_to root_path
    else
      @games = user.games
    end
  end
end
