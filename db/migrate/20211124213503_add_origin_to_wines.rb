class AddOriginToWines < ActiveRecord::Migration[6.0]
  def change
    add_column :wines, :origin, :string
  end
end
