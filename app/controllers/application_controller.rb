require 'application_responder'
require 'sys/cpu'
include Sys

class ApplicationController < ActionController::Base
  before_filter :set_user_time_zone
  before_filter :restrict_access, only: [:get_server_info]

  def get_server_info
    render status: 200, json: {
      "CPU" => "#{(CPU.load_avg[1] * 100).to_i}"
    }
  end

  self.responder = ApplicationResponder
  respond_to :html, :json
  WillPaginate.per_page = 10

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  protected
  def set_user_time_zone
    Time.zone = current_user.time_zone if user_signed_in? && current_user.time_zone.present?
  end



  def devise_parameter_sanitizer
    if resource_class == User
      User::ParameterSanitizer.new(User, :user, params)
    else
      super # Use the default one
    end
  end


  def after_sign_in_path_for(resource_or_scope)
    if current_user
      super
    else
      hq_dashboard_index_path
    end
  end

  def restrict_access
    api_key = ApiKey.find_by_access_token(params[:access_token])
    head :unauthorized unless api_key
  end
end