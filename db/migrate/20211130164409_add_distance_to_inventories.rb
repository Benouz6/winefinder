class AddDistanceToInventories < ActiveRecord::Migration[6.0]
  def change
    add_column :inventories, :distance, :string
  end
end
