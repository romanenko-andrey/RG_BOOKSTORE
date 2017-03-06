class CheckoutController < ApplicationController 
  rescue_from ActionController::RoutingError, :with => :error_render_method
  rescue_from ActionView::Template::Error, :with => :error_view_template
  rescue_from Wicked::Wizard::InvalidStepError, :with => :error_step_in_path_params

  include Wicked::Wizard
  steps :address, :delivery, :payment, :confirm, :complete

  before_action :authenticate_user!
  before_action :set_user, :set_cart, :set_shipping_methods_list
  before_action { @update_error = false }

  after_action :save_cart

  def new
    if @orders.empty?
      redirect_to books_path, notice: I18n.t('checkout.new.empty_list_of_book')
    else
      redirect_to checkout_path(wizard_steps.first)
    end
  end

  def show
    redirect_to books_path and return if @orders.nil? || @orders.empty?
    render_wizard
  end

  def update
    case @step
    when :address
      render_wizard(@user) if update_addresses?
    when :delivery
      render_wizard(@user) if update_shipping_method?
    when :payment
      render_wizard(@user) if update_credit_card?
    when :confirm
      create_new_order
      render_wizard(@user)
    end
    redirect_to checkout_path(@step) if @update_error
  end

  protected

  def create_new_order
    last_order = Order.where(user: @user, total_cost: totally_cost).last
    if last_order 
      session['last_order'] = last_order.id
      return
    end
    order_params = {
      user: @user, number: generate_order_number, items: @orders, discont: @cart['coupon'], 
      delivery_methods: @cart['delivery'].first, delivery_cost: @cart['delivery'].last, 
      total_cost: totally_cost, state: 'in_progress' }

    @order.update(order_params)
    @order.save
    flash[:notice] = I18n.t('checkout.new_order.success')
    session['cart']['finished'] = true
    session['last_order'] = @order.id
  end

  def generate_order_number
    DateTime.now.to_i.to_s
  end

  def update_credit_card?
    @credit_info = CreditCardForm.from_params(credit_card_params)
    session['cart']['credit_card'] = @credit_info.attributes
    unless @credit_info.valid?
      flash[:credit_card] = @credit_info.errors 
      flash[:error] = I18n.t('devise.registrations.credit_card_error')
      @update_error  = true
      return false
    end
    true
  end

  def update_shipping_method?
    if @shipping_index.nil?
      flash[:alert] = I18n.t('checkout.shipping_method.error')
      @update_error = true
      return false
    end
    @cart['delivery'] = @shipping_list[@shipping_index.to_i]
    true
  end

  def update_addresses?
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
    @billing_form = AddressForm.from_params(billing_address_params)
    @user.billing_address.update @billing_form.attributes 
    flash[:billing_address] = @billing_form.errors unless @billing_form.valid?
  end

  def update_shipping_address
    @shipping_form = AddressForm.from_params(shipping_address_params)
    if @shipping_form.identical
      @billing_form.identical = true
      @user.shipping_address.update @billing_form.attributes
    else
      @user.shipping_address.update @shipping_form.attributes
      flash[:shipping_address] = @shipping_form.errors unless @shipping_form.valid?
    end
  end

  def set_user
    @user = current_user
    @billing = @user.billing_address
    @shipping = @user.shipping_address
  end

  def totally_cost
    books_cost = @orders.reduce(0){|total, order| total + order['sum'].to_f * order['price'].to_f} 
    books_cost - @cart['coupon'].to_f + @cart['delivery'].last.to_f
  end

  def set_cart
    if step == :complete && session['last_order']
      @cart = {}
      @order = Order.find(session['last_order'])
      @orders = @order.items
      @address = @user.shipping_address
    else
      @cart = session['cart']
      @orders = @cart['orders']
      @credit_card = @cart['credit_card'] || {}
      @order = Order.new(@credit_card)
    end
  rescue
    redirect_to cart_path
  end

  def save_cart
    if session['cart'] && (session['cart']['finished'] == true)
      session['cart'] = {}
    else
      session['cart'] = @cart
    end
  end

  def set_shipping_methods_list
    @shipping_list = [
      ['self-delivery', 'up to month', '0'],
      ['delivery_at_door!', '3 - 7 days', '12.10'],
      ['delivery_next_days', '1 - 2 days', '28.50']
    ]
    @shipping_index = params[:delivery_method]
  end

  def error_render_method
    #flash[:alert] = I18n.t('application.routes.error')
    redirect_to books_path, alert: I18n.t('application.routes.error')
  end

  def error_view_template
    redirect_to books_path, alert: I18n.t('application.view_render.error')
  end

  def error_step_in_path_params
    redirect_to carts_path, alert: I18n.t('application.checkout_step.error')
  end

  def billing_address_params
    params.require(:user).require(:billing_address_attributes).permit([:first_name, :last_name, :addressee, :city, :country, :zip, :phone, :identical]).to_h
  end

  def shipping_address_params
    params.require(:user).require(:shipping_address_attributes).permit([:first_name, :last_name, :addressee, :city, :country, :zip, :phone, :identical]).to_h
  end

  def credit_card_params
    params.require(:order).permit(:card_number, :card_name, :mmyy, :cvv).to_h
  end
end
