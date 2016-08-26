class Plugins::CamaleonOauth::Api::V1::UserController < Plugins::CamaleonOauth::Api::ApiController
  skip_before_filter :verify_authenticity_token
  swagger_controller :users, 'Users'

  swagger_api :users do
    summary 'Fetches all users'
  end

  swagger_api :create do |api|
    summary 'Create a new user'
    param :form, 'user[email]', :string, :required, 'User email'
    param :form, 'user[username]', :string, :required, 'Username'
    param :form, 'user[password]', :string, :required, 'User password'
    param :form, 'user[password_confirmation]', :string, :required, 'User password confirmation'
    param :form, 'meta[first_name]', :string, :optional, 'User first name meta'
    param :form, 'meta[last_name]', :string, :optional, 'User last name meta'
    Plugins::CamaleonOauth::Api::ApiController::add_swagger_response_code(api, ERROR_NOT_CREATED)
    Plugins::CamaleonOauth::Api::ApiController::add_swagger_response_code(api, ERROR_CAPTCHA_VALIDATION)
  end

  def users
    render json: CamaleonCms::User.all
  end


  def create
    response = cama_register_user(params.require(:user).permit!, params.require(:meta).permit!)
    if response[:result]
      render_json_ok
    else
      if response[:type] == :captcha_error
        render_api_error(ERROR_CAPTCHA_VALIDATION)
      else
        render_api_error(ERROR_NOT_CREATED)
      end
    end
  end
end
