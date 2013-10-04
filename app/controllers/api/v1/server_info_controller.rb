class Api::V1::ServerInfoController < ApplicationController
  before_filter :restrict_access, only: [:index]

  # Temporarly using index method, may change in future
  def index
    @info = ServerInfo.create
    render status: 200, json: @info.as_json
  end

  private
    def restrict_access
      api_key = ApiKey.find_by_access_token(params[:access_token])
      head :unauthorized unless api_key
    end
end
