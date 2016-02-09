class SessionsController < ApplicationController

  def new
  end

  def create
    auth_hash = request.env['omniauth.auth']
    if auth_hash["uid"]
      @user = User.find_or_create_from_omniauth(auth_hash)
        if !@user.nil?
          session[:user_id] = @user.id
          flash[:notice] = nil
        else
          flash[:notice] = "Failed to save the user"
        end
    else
      flash[:notice] = "Failed to authenticate"
    end
    redirect_to root_path
  end

  def destroy
    session[:user_id] = nil if session[:user_id]
    flash[:notice] = "You have been logged out."
    redirect_to root_path
  end

end
