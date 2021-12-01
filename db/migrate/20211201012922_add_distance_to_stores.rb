class AddDistanceToStores < ActiveRecord::Migration[6.0]
  def change
    add_column :stores, :distance, :float
  end
end
