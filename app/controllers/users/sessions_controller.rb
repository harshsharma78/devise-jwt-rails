# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  include RackSessionFix
  respond_to :json

  def respond_with(resource, _opts = {})
    render json: {
             status: {
               code: 200,
               message: "Logged-in successfully!",
             },
             data: {
               user: UserSerializer.new(resource).serializable_hash[:data][:attributes],
             },
           }, status: :ok
  end

  def respond_to_on_destroy
    if current_user
      current_user.invalidate_all_jwt_tokens

      render json: {
               status: 200,
               message: "Logged-out successfully!",
             }, status: :ok
    else
      render json: {
               status: 401,
               message: "Please log-in first to continue!",
             }, status: :unauthorized
    end
  end

#   def refresh_token
#     user = User.find(params[:id])
#
#     if user && request.env["warden"].authenticate(scope: :user)
#       render json: {
#                status: 200,
#                message: "Refreshed token successfully!",
#                access_token: request.env["warden-jwt_auth.token"],
#              }, status: :ok
#     else
#       render json: {
#                status: 401,
#                message: "Invalid refresh token",
#              }, status: :unauthorized
#     end
#   end

  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
