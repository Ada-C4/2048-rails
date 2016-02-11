class Game < ActiveRecord::Base
  belongs_to :user

  def self.best_games
    return Game.where(completed: true).order(score: :desc).limit(20)
  end
end
