class Api::V1::SessionsController < ApplicationController
  skip_before_filter :verify_authenticity_token
  respond_to :json

  def create
    email = params[:email]
    password = params[:password]

    # Checking whether format is json or not
    if request.format != :json
      render status: 406, json: { message: t(:not_json) }
      return
    end

    # Checking for empty email or password
    if email.nil? or password.nil?
      render status: 400, json: { message: t(:empty_input) }
      return
    end

    @user = User.where(email: email.downcase).first

    # Checking whether user exists
    if @user.nil?
      render status: 401, json: { message: t(:invalid_field) }
      return
    end

    @user.ensure_authentication_token!

    # Finally, checking for password
    unless @user.valid_password?(password)
      render status: 401, json: { message: t(:invalid_field) }
    else
      render status: 200, json: @user.as_json.merge(success: true)
    end

  end

  def destroy
    @user = User.find_by_authentication_token(params[:id])

    if @user.nil?
      render status: 404, json: { message: 'Invalid token.' }
    else
      @user.reset_authentication_token!
      render status: 200, json: { token: params[:id] }
    end
  end


end
