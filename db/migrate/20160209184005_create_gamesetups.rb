class CreateGamesetups < ActiveRecord::Migration
  def change
    create_table :gamesetups do |t|
      t.integer :size
      t.string :cells
      t.integer :score
      t.boolean :over
      t.boolean :won
      t.boolean :keepPlaying

      t.timestamps null: false
    end
  end
end
