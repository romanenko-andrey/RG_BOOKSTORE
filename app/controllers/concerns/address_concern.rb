# :nodoc:
module AddressConcern
  extend ActiveSupport::Concern
  include Wicked::Wizard

  private

  def update_addresses?
    return unless @step == :address
    update_billing_address
    update_shipping_address
    if flash[:billing_address] || flash[:shipping_address]
      flash[:error] = I18n.t('devise.registrations.address_error')
      @update_error = true
      return false
    end
    true
  end

  def update_billing_address
    @bill_form = AddressForm.from_params(billing_address_params)
    @user.billing_address.update @bill_form.attributes
    flash[:billing_address] = @bill_form.errors unless @bill_form.valid?
  end

  def update_shipping_address
    @ship_form = AddressForm.from_params(shipping_address_params)
    if @ship_form.identical
      @bill_form.identical = true
      @user.shipping_address.update @bill_form.attributes
    else
      @user.shipping_address.update @ship_form.attributes
      flash[:shipping_address] = @ship_form.errors unless @ship_form.valid?
    end
  end

  def billing_address_params
    params.require(:user)
          .require(:billing_address_attributes)
          .permit([:first_name, :last_name, :addressee,
                   :city, :country, :zip, :phone, :identical])
          .to_h
  end

  def shipping_address_params
    params.require(:user)
          .require(:shipping_address_attributes)
          .permit([:first_name, :last_name, :addressee,
                   :city, :country, :zip, :phone, :identical])
          .to_h
  end
end
