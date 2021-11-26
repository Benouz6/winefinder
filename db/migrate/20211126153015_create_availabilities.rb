class CreateAvailabilities < ActiveRecord::Migration[6.0]
  def change
    create_table :availabilities do |t|
      t.jsonb :json_file
      t.references :wine, null: false, foreign_key: true

      t.timestamps
    end
  end
end
