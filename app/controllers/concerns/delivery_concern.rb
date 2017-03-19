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
    if @shipping_index.nil?
      flash[:alert] = I18n.t('checkout.shipping_method.error')
      @update_error = true
      return false
    end
    @cart['delivery'] = @shipping_list[@shipping_index.to_i]
    true
  end

  def set_shipping_methods_list
    @shipping_list = [
      ['self-delivery', 'up to month', '0'],
      ['delivery_at_door!', '3 - 7 days', '12.10'],
      ['delivery_next_days', '1 - 2 days', '28.50']
    ]
    @shipping_index = params[:delivery_method]
  end
end
