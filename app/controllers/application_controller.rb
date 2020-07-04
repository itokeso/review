class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :category


  def category
    @categories = Category.all
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
  
end
