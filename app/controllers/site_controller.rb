class SiteController < ApplicationController
  before_action :current_user

  def index
    if @current_user.nil?
      redirect_to login_path
    end
  end
end
