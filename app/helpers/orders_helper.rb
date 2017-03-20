# :nodoc:
module OrdersHelper
  def humanize(order)
    order.tr('_', ' ').titlecase
  end

  # def orders
  #   @order.items
  # end

  def shipping
    @user.shipping_address
  end

  def billing
    @user.billing_address
  end
end
