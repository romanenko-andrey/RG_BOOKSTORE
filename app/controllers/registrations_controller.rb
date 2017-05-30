# :nodoc:
class RegistrationsController < Devise::RegistrationsController
  def update
    super do |_user|
      update_address('shipping')
      update_address('billing')
      redirect_to(edit_user_registration_path) && return if flash[:error]
      set_flash_message :notice, :address_success
    end
  end

  private

  def update_address(address)
    return unless params[:form] == "#{address}_address"
    form = AddressForm.from_params(address_params address)
    
    case address
    when 'shipping' then @user.shipping_address.update form.attributes
    when 'billing'  then @user.billing_address.update form.attributes
    end
    
    return if form.valid?
    flash["#{address}_address".to_sym] = form.errors
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

  def address_params(address)
    params.require(:user).require("#{address}_address_attributes".to_sym)
                         .permit([:first_name, :last_name, :addressee,
                                  :city, :country, :zip, :phone]).to_h
  end

end
