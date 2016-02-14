class AddGameStateToGame < ActiveRecord::Migration
  def change
    add_column :games, :gamestate, :string
  end
end
