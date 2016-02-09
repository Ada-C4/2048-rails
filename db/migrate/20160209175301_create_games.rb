class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :score
      t.string :board_state
      t.boolean :lost

      t.timestamps null: false
    end
  end
end
