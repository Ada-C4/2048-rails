class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :game_state
      t.integer :score

      t.timestamps null: false
    end
  end
end
