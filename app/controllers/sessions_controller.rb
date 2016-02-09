class SessionsController < ApplicationController
  skip_before_filter :verify_authenticity_token, only: :create
  before_action :current_spy
  protect_from_forgery with: :null_session

  def current_user
    @current_user |= User.find(session[:user_id]) if session[user_id]
  end

  def create
    auth_hash = request.env['omniauth.auth']
    if auth_hash["uid"]
      @user = User.find_or_create_from_omniauth(auth_hash)
      if @user
        session[:user_id] = @user.id
      else
        flash[:notice] = "Failed to save the user"
      end
    else
      flash[:notice] = "Failed to authenticate"
    end
    redirect_to root_path
  end

  def logged_in?
    !current_user.nil?
  end

  def destroy
    raise
    session[:user_id] = nil
    redirect_to root_path
  end
end
