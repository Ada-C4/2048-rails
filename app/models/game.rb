class Game < ActiveRecord::Base
  belongs_to :user








  private

  def game_params
    params.permit(game:[:gamestate, :score, :over, :won, :keepplaying])
  end


end
