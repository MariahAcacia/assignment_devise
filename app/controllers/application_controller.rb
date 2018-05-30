class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_sign_up_parameters, if: :devise_controller?
  before_action :configure_update_parameters, if: :devise_controller?
  before_action :authenticate_user!


  protected

  def configure_sign_up_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :first_name, :last_name])
  end

  def configure_update_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :first_name, :last_name])
  end

end
