class RegistrationsController < Devise::RegistrationsController

  def update
    super do |user|
      @billing_form = AddressForm.from_params(billing_address_params)
      @shipping_form = AddressForm.from_params(shipping_address_params)  

      case params[:form]
      when 'billing_address'
        user.billing_address.update @billing_form.attributes 
        if !@billing_form.valid?
          set_flash_message :error,  :address_error
          redirect_to edit_user_registration_path, flash: { "#{params[:form]}": @billing_form.errors }
          return
        end
      when 'shipping_address'
        user.shipping_address.update @shipping_form.attributes
        if !@shipping_form.valid?
          set_flash_message :error,  :address_error
          redirect_to edit_user_registration_path, flash: { "#{params[:form]}": @shipping_form.errors }
          return
        end

      when 'all_addresses'
        user.billing_address.update @billing_form.attributes 
        user.shipping_address.update @shipping_form.attributes 
        unless @shipping_form.valid? || @billing_form.valid?
          set_flash_message :error,  :address_error
          redirect_to edit_user_registration_path, flash: { "billing_address": @billing_form.errors, 
                                                            "shipping_address": @shipping_form.errors }
          return
        end
      end
      set_flash_message :notice, :address_success
    end
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
    params.require(:user).require(:billing_address_attributes).permit([:first_name, :last_name, :addressee, :city, :country, :zip, :phone]).to_h
  end

  def shipping_address_params
    params.require(:user).require(:shipping_address_attributes).permit([:first_name, :last_name, :addressee, :city, :country, :zip, :phone]).to_h
  end
end