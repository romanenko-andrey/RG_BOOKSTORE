module CheckoutHelper
  def hide_cradit_card_code(credit_card)
    '** ** **' + credit_card['card_number'][-4, 4]
  end

  def checout_step(index, current_step)
    case
    when index + 1 < current_step
      'done'
    when index == current_step - 1
      'active'
    else 
      ''
    end
  end
end
