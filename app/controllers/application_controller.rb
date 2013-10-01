require 'application_responder'
require 'vmstat'

class ApplicationController < ActionController::Base
  before_filter :set_user_time_zone
  before_filter :restrict_access, only: [:get_server_info]

  def get_server_info
    mem = Vmstat.memory
    # Getting disk info for main partition is, temprorarily, for only
    # UN*X-like systems, such as GNU/Linux, BSD, Mac OS X etc.
    # Windows implementation will be added in future 
    disk = Vmstat.disk('/')

    render status: 200, json: {
      "CPU" => Vmstat.load_average.five_minutes,
      "Memory" => {
        "Total" => (mem.active_bytes + mem.inactive_bytes + mem.free_bytes + mem.wired_bytes) / 1024**2,
        "Free" => mem.free_bytes / 1024**2
      },
      "Disk" => {
        "Total" => disk.total_bytes / 1024**2,
        "Free" => disk.free_bytes / 1024**2
      },
      "Uptime" => (Time.now - Vmstat.boot_time).to_i / 60
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