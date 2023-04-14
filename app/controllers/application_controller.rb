class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  # before_action :configure_permitted_parameters, if: :devise_controller?

  # protected

  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :avatar])
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  # end

  before_action :update_allowed_parameters, if: :devise_controller?

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:name, :email, :password, :avatar)
    end
  end

end
