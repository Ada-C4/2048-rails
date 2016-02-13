class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :grid
      t.integer :score
      t.boolean :won
      t.boolean :completed

      t.timestamps null: false
    end
  end
end
