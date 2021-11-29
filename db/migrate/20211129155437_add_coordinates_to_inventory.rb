class AddCoordinatesToInventory < ActiveRecord::Migration[6.0]
  def change
    add_column :inventories, :latitude, :float
    add_column :inventories, :longitude, :float
  end
end
