class SiteController < ApplicationController

  def index
    @best_score = logged_in? ? @current_user.best_score : nil
  end

end
