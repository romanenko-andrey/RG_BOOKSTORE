# :nodoc:
class ApplicationController < ActionController::Base
  rescue_from ActionController::RoutingError, with: :error_render_method
  # rescue_from ActionView::Template::Error, with: :error_view_template
  rescue_from Wicked::Wizard::InvalidStepError, with: :error_step_in_path_params
  rescue_from CanCan::AccessDenied, with: :error_access_deninied

  protect_from_forgery with: :exception
  before_action :reload_rails_admin, if: :rails_admin_path?

  private

  def error_render_method
    redirect_to books_path, alert: I18n.t('application.routes.error')
  end

  def error_view_template
    redirect_to books_path, alert: I18n.t('application.view_render.error')
  end

  def error_step_in_path_params
    redirect_to carts_path, alert: I18n.t('application.checkout_step.error')
  end

  def error_access_deninied
    redirect_to main_app.root_path, alert: t('cancan.access_denied')
  end

  def reload_rails_admin
    models = %w(User Review Photo Book Author Order)
    models.each do |model|
      RailsAdmin::Config.reset_model(model)
    end
    RailsAdmin::Config::Actions.reset
    load(Rails.root.join('config', 'initializers', 'rails_admin.rb'))
  end

  def rails_admin_path?
    # controller_path =~ /rails_admin/ && Rails.env.development?
    controller_path =~ /static_pages/ && Rails.env.development?
  end
end
