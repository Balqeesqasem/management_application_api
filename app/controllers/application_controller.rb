class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
  rescue_from ArgumentError, with: :render_invalid_argument
  rescue_from StandardError, with: :render_internal_server_error

  private

  def render_unprocessable_entity(exception)
    if exception.is_a?(ActiveRecord::RecordInvalid)
      render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity
    else
      render json: { error: "Invalid Record" }, status: :unprocessable_entity
    end
  end

  def render_not_found(exception)
    render json: { error: exception.message }, status: :not_found
  end

  def render_invalid_argument(exception)
    render json: { error: exception.message }, status: :unprocessable_entity
  end

  def render_internal_server_error(exception)
    Rails.logger.error(exception.message)
    Rails.logger.error(exception.backtrace.join("\n"))
    render json: { error: "Internal Server Error" }, status: :internal_server_error
  end
end
