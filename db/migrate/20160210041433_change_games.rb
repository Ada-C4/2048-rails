class ChangeGames < ActiveRecord::Migration
  def change
    rename_column :games, :grid, :state
    add_column :games, :user_id, :integer
  end
end
