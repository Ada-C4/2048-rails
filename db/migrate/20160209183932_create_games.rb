class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.integer :user_id
      t.boolean :game_over

      t.timestamps null: false
    end
  end
end
