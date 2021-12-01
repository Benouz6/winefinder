class RemoveDetailsFromInventories < ActiveRecord::Migration[6.0]
  def change
    remove_column :inventories, :latitude, :float
    remove_column :inventories, :longitude, :float
    remove_column :inventories, :name_saq, :string
    remove_column :inventories, :address, :string
    remove_column :inventories, :distance, :string
  end
end
