class ModifyGames < ActiveRecord::Migration
  def change
    change_table :games do |t|
      add_column :games, :user_id, :integer
    end

    add_index :games, :user_id
  end
end
