class Game < ActiveRecord::Base
  belongs_to :user

  def self.best_games
    return Game.order(score: :desc).limit(20)
  end
end
