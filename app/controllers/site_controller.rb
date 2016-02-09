class SiteController < ApplicationController

  def index
    if current_user
      @username = current_user.name
    end  
  end
end
