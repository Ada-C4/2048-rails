class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.text :gamestate
      t.integer :score
      t.boolean :over
      t.boolean :won
      t.boolean :keepplaying
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
