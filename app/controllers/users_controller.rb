class UsersController < ApplicationController
  def current_user
    render :json => { id: session[:user_id] }, status: :ok
  end

  def last_game
    user = User.find_by(id: params[:id])
    unless user.nil?
      render :json => user.games.order('updated_at').last.state, status: :ok
    else
      render :json => [], status: :no_content
    end
  end
end
