module Api::V1
  class UsersController < ApplicationController
    swagger_controller :users, "User Management"

    before_action :authenticate_request!
    before_action :set_user, only: [:show, :update, :destroy]

    def self.add_common_params(api)
      api.param :form, "user[name]", :string, :required, "Name"
      api.param :form, "user[email]", :string, :required, "Email"
    end

    swagger_api :index do
      summary "Fetches all User items"
      notes "This lists all the active users"
    end

    swagger_api :show do
      summary "Fetches user by id"
      notes "Find user by id"
      param :path, :id, :integer, :optional, "User Id"
      response :unauthorized
      response :not_acceptable, "The request you made is not acceptable"
      response :requested_range_not_satisfiable
    end

    swagger_api :create do |api|
      summary "Create a new User item"
      notes "Create a new User item"
      Api::V1::UsersController::add_common_params(api)
      response :unauthorized
      response :not_acceptable
      response :unprocessable_entity
    end
    # GET /users
    def index
      @users = User.all
      render json: @users
    end

    # GET /users/1
    def show
      render json: @user
    end

    # POST /users
    def create
      @user = User.new(user_params)

      if @user.save
        render json: @user, status: :created
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /users/1
    def update
      if @user.update(user_params)
        render json: @user
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end

    # DELETE /users/1
    def destroy
        @user.destroy
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_user
        @user = User.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
      end
    end
end
