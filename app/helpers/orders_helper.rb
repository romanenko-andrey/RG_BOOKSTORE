module OrdersHelper
  def humanize(order)
    order.gsub('_', ' ').titlecase
  end

end
