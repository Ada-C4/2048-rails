class UsersController < ApplicationController
  # def current_user
  #   render :json => { id: session[:user_id] }, status: :ok
  # end

  def last_game
    unless current_user.nil? || current_user.games.empty?
      render :json => { id: current_user.games.order('updated_at').last.id }, status: :ok
    else
      render :json => [], status: :no_content
    end
  end
end
