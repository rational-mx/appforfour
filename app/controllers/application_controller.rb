class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  protect_from_forgery with: :exception
  layout :layout_by_resource

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :qr_url, unless: :devise_controller?

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << [:username, :email]
  end

  def qr_url
    @qr = RQRCode::QRCode.new(request.original_url)
  end

  def layout_by_resource
    if devise_controller?
      "login"
    else
      "application"
    end
  end

end
