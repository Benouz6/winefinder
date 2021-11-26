class ChangePriceToPriceCentsInWines < ActiveRecord::Migration[6.0]
  def change
    remove_column :wines, :price, :integer
    add_monetize :wines, :price
  end
end
