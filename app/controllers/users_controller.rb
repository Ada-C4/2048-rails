class UsersController < ApplicationController

  def index
    users = User.all
    @users= users.sort_by do |user|
      user.best_score
    end
    @users.reverse!
  end
end
