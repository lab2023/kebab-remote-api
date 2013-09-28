class Api::V2::UsersController < ApplicationController
  before_filter :restrict_access
  respond_to :json

  def index
    users = User.all.count
    admins = Admin.all.count

    render status: 200, json: {
      "active_users" => User.with_block_status(:unblocked).count + admins,
      "total_users"  => users + admins,
      "total_user_by_role" => [
          {
            "role_name" => "Admin",
            "count"     => admins
          },
          {
            "role_name" => "User",
            "count"     => users,
          },
          {
            "role_name" => "Editor",
            "count"     => User.with_role(:editor).count
          }
      ]       
    }
  end

  private

  def restrict_access
    api_key = ApiKey.find_by_access_token(params[:access_token])
    head :unauthorized unless api_key
  end
end