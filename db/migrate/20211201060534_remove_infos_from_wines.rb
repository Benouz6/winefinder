class RemoveInfosFromWines < ActiveRecord::Migration[6.0]
  def change
    remove_column :wines, :description, :string
    remove_column :wines, :saq_id, :integer
  end
end
