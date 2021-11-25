class AddSaqIdToWines < ActiveRecord::Migration[6.0]
  def change
    add_column :wines, :saq_id, :integer
  end
end
