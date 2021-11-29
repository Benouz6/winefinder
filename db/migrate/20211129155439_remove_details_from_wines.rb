class RemoveDetailsFromWines < ActiveRecord::Migration[6.0]
  def change
    remove_column :wines, :country, :string
    remove_column :wines, :region, :string
  end
end
