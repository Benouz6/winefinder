class CreateLiveAvailabilities < ActiveRecord::Migration[6.0]
  def change
    create_table :live_availabilities do |t|
      t.integer :qty
      t.string :address
      t.references :wine, null: false, foreign_key: true

      t.timestamps
    end
  end
end
