class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  layout :layout_by_resource

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:account_update) do |u|
      u.permit(:email, :password, :current_password)
    end
  end

  # Layout per resource_name AND action
  def layout_by_resource
    if devise_controller? && resource_name == :user && action_name == "new"
      "login"
    else
      "application"
    end
  end
end
