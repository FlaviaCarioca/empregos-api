module API::V1
  class UsersController < ApplicationController
    skip_before_action :authenticate_request, only: :create

    def create
      if user_params[:user_type].upcase == (Constants::CANDIDATE).upcase
        profile = Candidate.create(first_name: user_params[:first_name], last_name: user_params[:last_name])
        # TODO: Password needs to be hashed and salted before saving to db otherwise major security risk
        profile.user = User.create(email: user_params[:email], password: user_params[:password])
        render json: { candidate_id: profile.id }, status: :created
      end
      rescue => e
        logger.error("AuthController#create - Exception: #{e}")
        render json: { error: 'Something went wrong. Please try again later' }, status: :unprocessable_entity
    end

    private

    def user_params
      params.require(:user).permit(:email, :password, :first_name, :last_name, :user_type)
    end
  end
end
