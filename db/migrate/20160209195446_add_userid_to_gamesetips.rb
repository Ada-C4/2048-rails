class AddUseridToGamesetips < ActiveRecord::Migration
  def change
    add_column :gamesetups, :user_id, :integer
  end
end
