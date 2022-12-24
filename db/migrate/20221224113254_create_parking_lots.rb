class CreateParkingLots < ActiveRecord::Migration[7.0]
  def up
    create_table :parking_lots do |t|
      t.string :name, null: false
      t.string :fee_model, null: false
      t.integer :small_spots, null: false
      t.integer :medium_spots, null: false
      t.integer :large_spots, null: false
      t.timestamps
    end
  end

  def down
    drop_table :parking_lots
  end
end
