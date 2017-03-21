# :nodoc:
module OrdersHelper
  def humanize(order)
    order.to_s.tr('_', ' ').titlecase
  end

  def shipping
    @user.shipping_address
  end

  def billing
    @user.billing_address
  end
end
