class AddColumnToInventories < ActiveRecord::Migration[6.0]
  def change
    add_column :inventories, :name_saq, :string
    add_column :inventories, :address, :string
  end
end
