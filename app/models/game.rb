class Game < ActiveRecord::Base
  belongs_to :user
  validates :gamestate, presence: true
end
