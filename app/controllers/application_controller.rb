class ApplicationController < ActionController::Base
  # before_action :authenticate_user!, expect: :index
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up,
                                      keys: [:nickname, :firstname, :lastname, :firstname_reading, :lastname_reading, :birthday])
  end
end
