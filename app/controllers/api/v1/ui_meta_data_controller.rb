class Api::V1::UiMetaDataController < ApplicationController
  include ActionController::RequestForgeryProtection
  include RackSessionFix

  def meta_data
    json_data = {
      csrf: {
        token: form_authenticity_token,
        secure: true,
      },
    }
    if current_user
      json_data["current_user"] = UserSerializer.new(current_user).serializable_hash[:data][:attributes]
    end
    render json: json_data, status: :ok
  end
end
