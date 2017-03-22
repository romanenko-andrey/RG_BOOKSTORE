# :nodoc:
module DeliveryConcern
  extend ActiveSupport::Concern
  include Wicked::Wizard
  included do
    before_action :set_shipping_methods_list
  end

  private

  def update_shipping_method?
    return unless @step == :delivery
    unless params[:delivery_method]
      flash[:alert] = I18n.t('checkout.shipping_method.error')
      return false
    end
    @cart['delivery'] = params[:delivery_method]
    true
  end

  def set_shipping_methods_list
    #have to depend on user address and another factors 
    @shipping_list = [
      ['self-delivery', 'up to month', '0'],
      ['delivery_at_door!', '3 - 7 days', '12.10'],
      ['delivery_next_days', '1 - 2 days', '28.50']
    ]
  end
end
