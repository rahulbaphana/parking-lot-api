class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  private

  def record_not_found(record)
    render json:   { code: "api.parking.lot", message: "Record not found with id #{record.id}" },
           status: :not_found
  end
end
