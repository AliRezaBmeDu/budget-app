class ApplicationController < ActionController::Base
    # protect_from_forgery with: :exception
    before_action :authenticate_user_unless_splash
    before_action :authenticate_user!, unless: -> { controller_name == 'pages' && action_name == 'splash' }

  before_action :update_allowed_parameters, if: :devise_controller?

  protected

  def authenticate_user_unless_splash
    authenticate_user! unless controller_name == 'pages' && action_name == 'splash'
  end

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:name, :email, :password)
    end
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:name, :email, :password, :current_password)
    end
  end
end
