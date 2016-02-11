class AddBestScoreToUsers < ActiveRecord::Migration
  def change
    add_column :users, :best_score, :integer
  end
end
