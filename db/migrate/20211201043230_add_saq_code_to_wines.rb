class AddSaqCodeToWines < ActiveRecord::Migration[6.0]
  def change
    add_column :wines, :saq_code, :integer
  end
end
