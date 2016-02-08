class SessionsController < ApplicationController
  def create
    auth_hash = request.env['omniauth.auth']
    if auth_hash["uid"].nil?
      flash[:notice] = "Failed to authenticate"
    else
      @user = User.find_or_create_from_omniauth(auth_hash)
      binding.pry
      if @user
        session[:user_id] = @user.id
      else
        flash[:notice] = "Failed to save the user"
      end
    end
    redirect_to root_path
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Hasta la vista, baby!"
    redirect_to root_path
  end
end
