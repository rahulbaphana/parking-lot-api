class ParkingLot < ApplicationRecord
  validates :name, presence: true
  validates :fee_model, presence: true
  validates :small_spots, presence: true
  validates :medium_spots, presence: true
  validates :large_spots, presence: true
end
