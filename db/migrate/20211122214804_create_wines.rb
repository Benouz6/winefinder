class CreateWines < ActiveRecord::Migration[6.0]
  def change
    create_table :wines do |t|
      t.string :name
      t.string :region
      t.string :description
      t.string :color
      t.integer :price

      t.timestamps
    end
  end
end
