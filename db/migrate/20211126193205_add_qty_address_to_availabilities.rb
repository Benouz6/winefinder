class AddQtyAddressToAvailabilities < ActiveRecord::Migration[6.0]
  def change
    add_column :availabilities, :qty, :integer
    add_column :availabilities, :address, :string
  end
end
