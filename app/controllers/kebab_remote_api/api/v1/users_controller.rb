module KebabRemoteApi
	class Api::V1::UsersController < KebabRemoteApi::ApplicationController
  	before_filter :restrict_access
  	respond_to :json

	  def index
  	  render status: 200, json: {
    	  'active_user' => User.with_block_status(:active).count,
      	'total_user'  => User.all.count,
   	    'total_user_by_role' => User.role.values.map { |role| { "role_name" => role.to_s,
                                                  "count" => User.with_role(role).count } }
    	}.to_json
  	end

  private

  	def restrict_access
    	api_key = ApiKey.first#find_by_access_token(params[:access_token])
    	head :unauthorized unless api_key
  	end
	end
end