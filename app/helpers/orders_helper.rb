# :nodoc:
module OrdersHelper
  def humanize(order)
    order.tr('_', ' ').titlecase
  end
end
