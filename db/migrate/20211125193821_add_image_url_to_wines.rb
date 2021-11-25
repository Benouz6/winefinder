class AddImageUrlToWines < ActiveRecord::Migration[6.0]
  def change
    add_column :wines, :image_url, :string
  end
end
