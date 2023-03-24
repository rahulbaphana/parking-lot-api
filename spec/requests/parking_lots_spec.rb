require "rails_helper"

RSpec.describe "/parking_lots", type: :request do
  let(:valid_attributes) do
    {
      name:         "ParkingLot at mall",
      fee_model:    "MALL",
      small_spots:  10,
      medium_spots: 11,
      large_spots:  12
    }
  end

  let(:invalid_attributes) do
    {
      name:         nil,
      fee_model:    nil,
      small_spots:  nil,
      medium_spots: nil,
      large_spots:  nil
    }
  end

  let(:valid_headers) do
    {}
  end

  describe "GET /index" do
    it "renders a successful response" do
      ParkingLot.create! valid_attributes
      get parking_lots_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    context "valid id to show" do
      it "renders a successful response" do
        parking_lot = ParkingLot.create! valid_attributes
        get parking_lot_url(parking_lot), as: :json
        expect(response).to be_successful
      end
    end

    context "invalid id to /show" do
      it "fails with error response" do
        parking_lot = ParkingLot.create! valid_attributes
        get parking_lot_url(parking_lot) << "1", as: :json
        expect(response.status).to eq(404)
        expect(response.body).to eq("{\"code\":\"api.parking.lot\",\
\"message\":\"Record not found with id #{parking_lot.id}1\"}")
      end
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new ParkingLot" do
        expect do
          post parking_lots_url,
               params: { parking_lot: valid_attributes }, headers: valid_headers, as: :json
        end.to change(ParkingLot, :count).by(1)
      end

      it "renders a JSON response with the new parking_lot" do
        post parking_lots_url,
             params: { parking_lot: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new ParkingLot" do
        expect do
          post parking_lots_url,
               params: { parking_lot: invalid_attributes }, as: :json
        end.to change(ParkingLot, :count).by(0)
      end

      it "renders a JSON response with errors for the new parking_lot" do
        post parking_lots_url,
             params: { parking_lot: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) do
        {
          name:        "This is new name",
          small_spots: 12
        }
      end

      it "updates the requested parking_lot" do
        parking_lot = ParkingLot.create! valid_attributes
        patch parking_lot_url(parking_lot),
              params: { parking_lot: new_attributes }, headers: valid_headers, as: :json
        parking_lot.reload
        expect(parking_lot.name).to eq(new_attributes[:name])
        expect(parking_lot.small_spots).to eq(new_attributes[:small_spots])
      end

      it "renders a JSON response with the parking_lot" do
        parking_lot = ParkingLot.create! valid_attributes
        patch parking_lot_url(parking_lot),
              params: { parking_lot: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the parking_lot" do
        parking_lot = ParkingLot.create! valid_attributes
        patch parking_lot_url(parking_lot),
              params: { parking_lot: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested parking_lot" do
      parking_lot = ParkingLot.create! valid_attributes
      expect do
        delete parking_lot_url(parking_lot), headers: valid_headers, as: :json
      end.to change(ParkingLot, :count).by(-1)
    end
  end
end
