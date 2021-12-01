class AddAddressToStores < ActiveRecord::Migration[6.0]
  def change
    add_column :stores, :address, :string
  end
end
