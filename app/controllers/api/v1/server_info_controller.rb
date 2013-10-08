class Api::V1::ServerInfoController < ApplicationController
  before_filter :restrict_access, only: [:get_server_info]

  def get_server_info
    @info = ServerInfo.new
    render status: 200, json: @info.as_json #if @info.save
  end

  private
    def restrict_access
      api_key = ApiKey.first #find_by_access_token(params[:access_token])
      head :unauthorized unless api_key
    end
end
