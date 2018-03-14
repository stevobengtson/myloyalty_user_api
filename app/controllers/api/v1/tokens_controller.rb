module Api::V1
  class TokensController < ApplicationController
    before_action :authenticate_request!, only: [:authorized]

    # POST /tokens
    def create
      user = User.find_by(email: user_params[:email].to_s.downcase)

      if user && user.authenticate(user_params[:password])
        auth_token = ::JsonWebToken.encode({user_id: user.id})
        render json: {auth_token: auth_token}, status: :ok
      else
        render json: {error: 'Invalid username / password'}, status: :unauthorized
      end
    end

    # GET /tokens/authorized
    def authorized
      render json: @current_user, status: :ok
    end

    private
      # Only allow a trusted parameter "white list" through.
      def user_params
          params.require(:user).permit(:email, :password)
      end
  end
end
