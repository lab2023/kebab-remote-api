module KebabRemoteApi
  class Api::V1::ServerInfoController < KebabRemoteApi::ApplicationController
    def get_server_info
      @info = ServerInfo.new
      render status: 200, json: @info.as_json
    end
  end
end