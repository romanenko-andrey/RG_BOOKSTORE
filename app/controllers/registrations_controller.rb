# :nodoc:
class RegistrationsController < Devise::RegistrationsController
  def update
    super do |_user|
      update_billing_address
      update_shipping_address
      redirect_to(edit_user_registration_path) && return if flash[:error]
      set_flash_message :notice, :address_success
    end
  end

  private

  def update_billing_address
    return unless params[:form] == 'billing_address'
    @billing_form = AddressForm.from_params(billing_address_params)
    @user.billing_address.update @billing_form.attributes
    return if @billing_form.valid?
    flash[:billing_address] = @billing_form.errors
    flash[:error] = I18n.t('devise.registrations.address_error')
  end

  def update_shipping_address
    return unless params[:form] == 'shipping_address'
    @shipping_form = AddressForm.from_params(shipping_address_params)
    @user.shipping_address.update @shipping_form.attributes
    return if @shipping_form.valid?
    flash[:shipping_address] = @shipping_form.errors
    flash[:error] = I18n.t('devise.registrations.address_error')
  end

  protected

  def update_resource(resource, params)
    if request.params[:check_pass]
      resource.update_with_password(params)
    else
      resource.update_without_password params.except(:current_password)
    end
  end

  def billing_address_params
    params.require(:user)
          .require(:billing_address_attributes)
          .permit([:first_name, :last_name, :addressee,
                   :city, :country, :zip, :phone]).to_h
  end

  def shipping_address_params
    params.require(:user)
          .require(:shipping_address_attributes)
          .permit([:first_name, :last_name, :addressee,
                   :city, :country, :zip, :phone]).to_h
  end
end
