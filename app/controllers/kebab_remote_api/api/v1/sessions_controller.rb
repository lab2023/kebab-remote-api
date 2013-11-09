module KebabRemoteApi

	class Api::V1::SessionsController < KebabRemoteApi::ApplicationController
  	skip_before_filter :verify_authenticity_token, :authenticate_request, :restrict_access
  	respond_to :json

  	def create
  	  email = params[:email]
	    password = params[:password]

  	  # Checking whether format is json or not
	  	if request.format != :json
      	render status: 406, json: { message: I18n.t('kebab_remote_api.not_json') }
      	return
    	end

    	# Checking for empty email or password
    	if email.nil? or password.nil?
      	render status: 400, json: { message: I18n.t('kebab_remote_api.empty_input') }
      	return
    	end

    	@admin = Admin.where(email: email.downcase).first

	    # Checking whether user exists
  	  if @admin.nil?
    	  render status: 401, json: { message: I18n.t('kebab_remote_api.invalid_field') }
      	return
	    end

  	  @admin.ensure_authentication_token!

    	# Finally, checking for password
    	unless @admin.valid_password?(password)
     	 render status: 401, json: { message: I18n.t('kebab_remote_api.invalid_field') }
    	else
      	render status: 200, json: @admin.as_json.merge(success: true)
    	end
	  end

  	def destroy
    	@admin = Admin.find_by_authentication_token(params[:id])

    	if @admin.nil?
      	render status: 404, json: { message: I18n.t('kebab_remote_api.invalid_token') }
    	else
      	@admin.reset_authentication_token!
      	render status: 200, json: { token: params[:id] }
    	end
  	end
	end
end
