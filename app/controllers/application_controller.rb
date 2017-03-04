class ApplicationController < ActionController::Base
  require 'byebug'
  protect_from_forgery with: :exception
  before_action :set_categories
  #before_action :authenticate_user!

  before_filter :configure_permitted_parameters, if: :devise_controller?


  protected
    def configure_permitted_parameters
     # devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :password, :password_confirmation) }
     # devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:email, :password, :password_confirmation, :current_password)}
     #byebug
    end

  private 
    def set_categories
      @categories = Category.pluck(:name)  
    end
end
