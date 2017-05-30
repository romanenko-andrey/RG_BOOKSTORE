# :nodoc:
module CheckoutHelper
  def hide_cradit_card_code(credit_card)
    '** ** **' + credit_card[-4, 4]
  end

  def checout_step(index, current_step)
    if index + 1 < current_step
      'done'
    elsif index == current_step - 1
      'active'
    else
      ''
    end
  end

  def book_image_in(order)
    order[:photo] || ''
  end

  def shipping
    @user.shipping_address
  end

  def billing
    @user.billing_address
  end

  def identical_address?
    @user.shipping_address.identical  
  end

  def selected_method(pos)
    return if @cart[:delivery].nil? || @cart[:delivery].empty?
    pos == @cart[:delivery].to_i ? true : false
  end

  def back_address
    params['back']
  end
end
