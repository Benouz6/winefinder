class AddSaqIdentifierToStores < ActiveRecord::Migration[6.0]
  def change
    add_column :stores, :saq_identifier, :integer
  end
end
