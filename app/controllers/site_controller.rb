class SiteController < ApplicationController
  before_action :current_user

  def index
    @games = current_user.games.order(:created_at).reverse
  end
  
end
