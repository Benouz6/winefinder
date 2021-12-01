class RemoveAdressFromStores < ActiveRecord::Migration[6.0]
  def change
    remove_column :stores, :adress, :string
  end
end
