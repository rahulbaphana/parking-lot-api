require "rails_helper"

RSpec.describe ParkingLot, type: :model do
  subject(:parking_lot) do
    FactoryBot.build(:parking_lot,
                     fee_model:,
                     small_spots:,
                     medium_spots:,
                     large_spots:)
  end

  let(:fee_model) { "MALL" }
  let(:small_spots) { 10 }
  let(:medium_spots) { 11 }
  let(:large_spots) { 12 }

  describe ".save!" do
    let(:saved_parking_lot) { parking_lot.save! }

    it "saves the parking lot to db" do
      saved_parking_lot

      expect(parking_lot.reload.id).to_not be nil
    end
  end
end
