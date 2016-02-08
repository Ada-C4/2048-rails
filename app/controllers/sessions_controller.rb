class SessionsController < ApplicationController

  def new
  end

  def create
    data = params[:session_data]
    @user= User.find_by_username(data[:username])
    if !@user.nil? && @user.authenticate(data[:password])
      session[:user_id] = @user.id
      flash[:success] = "You are now logged in."
      redirect_to root_path
    else
      flash.now[:error] = "Invalid username and password combination."
      render :new
    end
  end

  def destroy
    @current_user = nil
    session[:user_id] = nil
    flash[:success] = "You are now logged out."
    redirect_to root_path
  end
end
