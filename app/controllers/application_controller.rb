class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :current_user, :except => {:games =>:show}

  helper_method :current_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user
  # The helper_method line allows us to use @current_user in our view files.

  def require_login
    unless current_user
      flash[:error] = "Please log in."
      redirect_to login_path
    end
  end
end
