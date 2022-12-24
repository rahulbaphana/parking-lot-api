require "rails_helper"

RSpec.describe ParkingLotsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/parking_lots").to route_to("parking_lots#index")
    end

    it "routes to #show" do
      expect(get: "/parking_lots/1").to route_to("parking_lots#show", id: "1")
    end

    it "routes to #create" do
      expect(post: "/parking_lots").to route_to("parking_lots#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/parking_lots/1").to route_to("parking_lots#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/parking_lots/1").to route_to("parking_lots#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/parking_lots/1").to route_to("parking_lots#destroy", id: "1")
    end
  end
end
