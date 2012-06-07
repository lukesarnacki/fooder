class ApplicationController < ActionController::Base
  protect_from_forgery

  #rescue_from  ActiveRecord::RecordNotFound do |error|
  #render :json => {
  #         :message => error.message
  #       },
  #       :status => 404
  #end

  #rescue_from  ActiveRecord::RecordInvalid do |error|
  #render :json => {
  #         :errors => error.record.errors
  #       },
  #       :status => 422
  #end
end
