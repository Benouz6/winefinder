class AddDetailsToWines < ActiveRecord::Migration[6.0]
  def change
    add_column :wines, :country, :string
    add_column :wines, :grapes, :string
    add_column :wines, :alcohol, :integer
  end
end
