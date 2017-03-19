# :nodoc:
module CreditConcern
  extend ActiveSupport::Concern
  include Wicked::Wizard

  private

  def update_credit_card?
    return unless @step == :payment
    @credit_info = CreditCardForm.from_params(credit_card_params)
    @cart[:credit_card] = @credit_info.attributes
    unless @credit_info.valid?
      flash[:credit_card] = @credit_info.errors
      flash[:error] = I18n.t('devise.registrations.credit_card_error')
      @update_error = true
      return false
    end
    true
  end

  def credit_card_params
    params.require(:order).permit(:card_number, :card_name, :mmyy, :cvv).to_h
  end
end
