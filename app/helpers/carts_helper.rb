# :nodoc:
module CartsHelper
  def input_value(order)
    order[:sum].to_s
  end

  def sub_total(order)
    order[:sum].to_f * order[:price].to_f
  end

  def total_sum
    @orders.reduce(0) { |x, y| x + y[:sum].to_f * y[:price].to_f }
  end

  def coupon
    @cart[:coupon]
  end

  def delivery_item
    @shipping_list[@cart[:delivery].to_i] if delivery?
  end

  def delivery_cost
    delivery_item.last if delivery?
  end

  def delivery_type
    delivery_item.first if delivery?
  end

  def delivery_time
    delivery_item[1] if delivery?
  end

  def delivery?
    !(@cart[:delivery].nil? || @cart[:delivery].empty?)
  end

  def order_total
    total_sum - coupon.to_f + delivery_cost.to_f
  end
end
