class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

	# def index
	# 	render '/index.html.erb'
	# end
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :username, :phone])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :username, :phone])
  end

end