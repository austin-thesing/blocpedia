class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include Pundit
  include Redcarpet
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  # before action callback for devise controller to utilize configure_permitted_parameters
  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

protected

  def configure_permitted_parameters
    #devise_parameter_sanitizer.for is depreciated in Devise 4.2 so I switched to .permit
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:email, :password, :password_confirmation, :firstname, :lastname, :username) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:email, :password, :password_confirmation, :current_password, :firstname, :lastname, :username) }
  end
end
