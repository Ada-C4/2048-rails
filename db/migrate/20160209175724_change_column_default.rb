class ChangeColumnDefault < ActiveRecord::Migration
  def change
    change_column_default(:games, :lost, false)
  end
end
