module Api::V1
  class ApiController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :not_found
    rescue_from ActionController::ParameterMissing, with: :missing_param_error

    def not_found
      render status: :not_found, json: { status: 404, code: 'not-found', detail: '404 Not Found' }
    end

    def missing_param_error(exception)
      render status: :unprocessable_entity, json: { error: exception.message }
    end
  end
end