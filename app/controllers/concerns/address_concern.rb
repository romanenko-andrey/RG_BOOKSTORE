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
      return false
    end
    true
  end

  def update_billing_address
    @bill_form = AddressForm.from_params(address_params 'billing')
    @user.billing_address.update @bill_form.attributes
    flash[:billing_address] = @bill_form.errors unless  @bill_form.valid?
  end

  def update_shipping_address
    form = AddressForm.from_params(address_params 'shipping')
    if form.identical
      form.identical = true
      @user.shipping_address.update @bill_form.attributes
    else
      @user.shipping_address.update form.attributes
      flash[:shipping_address] = form.errors unless form.valid?
    end
  end

  def address_params(address)
    params.require(:user)
          .require("#{address}_address_attributes".to_sym)
          .permit([:first_name, :last_name, :addressee,
                   :city, :country, :zip, :phone, :identical]).to_h
  end
end
