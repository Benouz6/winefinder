class AddDefaultValueToRating < ActiveRecord::Migration[6.0]
  def change
    change_column :wines, :rating, :integer, null: false, default: 0
  end
end
