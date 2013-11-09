module KebabRemoteApi
	class Api::V1::UsersController < KebabRemoteApi::ApplicationController
  	respond_to :json

	  def index
  	  render status: 200, json: {
    	  'active_user' => User.with_block_status(:active).count,
      	'total_user'  => User.all.count,
   	    'total_user_by_role' => User.role.values.map { |role| { "role_name" => role.to_s,
                                                  "count" => User.with_role(role).count } }
    	}.to_json
  	end
	end
end