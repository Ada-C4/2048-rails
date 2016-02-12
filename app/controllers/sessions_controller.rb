class SessionsController < ApplicationController
  before_action :require_user, except: [:new, :create]

  def new
  end

  def create
    auth_hash = request.env['omniauth.auth']
    if auth_hash["uid"]
      @user = User.find_or_create_from_omniauth(auth_hash)
      if @user
        session[:user_id] = @user.id
        redirect_to root_path
      else
        redirect_to root_path, notice: "Login Failed"
      end
    else
      redirect_to root_path, notice: "Login Failed"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "You've logged out.  See you later!"
  end
end
