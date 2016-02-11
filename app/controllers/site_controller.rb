class SiteController < ApplicationController
  before_action :current_user

  def index
    if current_user
      @games = current_user.games.order(:created_at).reverse
    end
  end
  
end
