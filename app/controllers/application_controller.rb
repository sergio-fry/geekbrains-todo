class ApplicationController < ActionController::Base
  # before_action :authenticate_user!
  include Pundit::Authorization

  before_action :configure_permitted_parameters, if: :devise_controller?

  before_action :switch_locale

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  def switch_locale(&action)
    I18n.locale = session[:locale] || I18n.default_locale
  end
end
