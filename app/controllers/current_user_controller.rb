class CurrentUserController < ApplicationController
  before_action :authenticate_user!, only: [:logged_in_user]

  def index
    users = User.all
    render json: users
  end

  def logged_in_user
    render json: UserSerializer.new(current_user).serializable_hash[:data][:attributes], status: :ok
  end
end
