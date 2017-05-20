# Authentication class
module API::V1
  class AuthController < ApplicationController
    skip_before_action :authenticate_request

    def authenticate
      user = User.find_by_credentials(auth_params[:username], auth_params[:password])
      unless user.blank?
        token = user.first.generate_auth_token

        if token.blank?
          render json: { error: 'Something went wrong. Please try again later' }, status: :internal_server_error
        else
          render json: { auth_token: token, user_type: user.first.profile_type }, status: :ok
        end
      else
        render json: { error: 'Invalid username or password' }, status: :unauthorized
      end
    end

    private

    def auth_params
      params.require(:auth).permit(:username, :password)
    end
  end
end
