class AddRatingToWines < ActiveRecord::Migration[6.0]
  def change
    add_column :wines, :rating, :integer
  end
end
