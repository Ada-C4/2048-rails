class AddJsoncellsToGamesetups < ActiveRecord::Migration
  def change
    add_column :gamesetups, :json_cells, :string
  end
end
