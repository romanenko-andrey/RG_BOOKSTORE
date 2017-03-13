class ApplicationController < ActionController::Base
 # require 'byebug'


  protect_from_forgery with: :exception
  before_action :set_categories
  before_filter :reload_rails_admin, if: :rails_admin_path?

  rescue_from CanCan::AccessDenied do |_|
    redirect_to main_app.root_path, alert: t('cancan.access_denied')
  end

  private 
    def set_categories
      @categories = Category.pluck(:name)  
    end

    def reload_rails_admin
      models = %W(User Review Photo Book Author Order ShippingAddress BillingAddress)
      models.each do |m|
        RailsAdmin::Config.reset_model(m)
      end
      RailsAdmin::Config::Actions.reset

      load("#{Rails.root}/config/initializers/rails_admin.rb")
    end

    def rails_admin_path?
      #controller_path =~ /rails_admin/ && Rails.env.development?
      controller_path =~ /static_pages/ && Rails.env.development?
    end
end
