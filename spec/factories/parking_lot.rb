FactoryBot.define do
  factory :parking_lot, class: "ParkingLot" do
    name { "ParkingLot at mall" }
    fee_model { "MALL" }
    small_spots { 10 }
    medium_spots { 11 }
    large_spots { 12 }
    created_at { Time.zone.now }
    updated_at { Time.zone.now }
  end
end
