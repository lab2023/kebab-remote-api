module KebabRemoteApi
	class ApplicationController < ActionController::Base
		before_filter :authenticate_request, :restrict_access

		respond_to :json

  	# Prevent CSRF attacks by raising an exception.
  	# For APIs, you may want to use :null_session instead.
  	protect_from_forgery with: :exception

  	protected
  		def authenticate_request
  			admin = Admin.find_by_authentication_token(params[:secret_token])
  			head :unauthorized unless admin
  		end

  		def restrict_access
    		api_key = ApiKey.first
    		head :unauthorized unless api_key
  		end
	end
end
