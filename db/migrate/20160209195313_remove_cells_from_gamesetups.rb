class RemoveCellsFromGamesetups < ActiveRecord::Migration
  def change
    remove_column :gamesetups, :cells, :string
  end
end
