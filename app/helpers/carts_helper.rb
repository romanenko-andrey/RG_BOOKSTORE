module CartsHelper
  def input_value(order)
    order[:sum].to_s
  end

  def sub_total(order)
    order[:sum].to_f * order[:price].to_f
  end

  def total_sum
    @orders.reduce(0){|x, y| x + y[:sum].to_f*y[:price].to_f} 
  end

  def coupon
    @cart[:coupon]
  end

  def delivery_cost
    @cart[:delivery].last if delivery?
  end

  def delivery?
    !@cart[:delivery].nil?
  end

  def order_total
    total_sum - coupon.to_f + delivery_cost.to_f
  end
end
