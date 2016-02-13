class ChangeGamesGameStateFromStringToText < ActiveRecord::Migration
  def change
    change_column :games, :game_state, :text
  end
end
