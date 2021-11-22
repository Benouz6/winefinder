class CreateFoodPairings < ActiveRecord::Migration[6.0]
  def change
    create_table :food_pairings do |t|
      t.references :food, null: false, foreign_key: true
      t.references :wine, null: false, foreign_key: true

      t.timestamps
    end
  end
end
