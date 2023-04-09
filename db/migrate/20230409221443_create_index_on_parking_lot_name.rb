class CreateIndexOnParkingLotName < ActiveRecord::Migration[7.0]
  def change
    add_index :parking_lots, :name
  end
end
