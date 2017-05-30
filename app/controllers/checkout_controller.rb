# :nodoc:
class CheckoutController < ApplicationController
  include Wicked::Wizard
  include AddressConcern
  include DeliveryConcern
  include CreditConcern
  include OrderConcern
 
  steps :address, :delivery, :payment, :confirm, :complete

  before_action :authenticate_user!
  before_action :set_user

  after_action :save_cart

  def new
    if @orders.empty?
      redirect_to books_path, notice: I18n.t('checkout.new.empty_list_of_book')
    else
      redirect_to checkout_path(wizard_steps.first)
    end
  end

  def show
    redirect_to(books_path) && return if @orders.nil? || @orders.empty?
    render_wizard
  end

  def update
    if update_addresses? || update_shipping_method? || update_credit_card?
      back = params['back']
      jump_to(back.to_sym) unless back.nil? || back.empty?
      render_wizard(@user)  
    end

    redirect_to books_path if create_new_order?
    redirect_to checkout_path(@step) if flash[:error]
  end

  protected

  def set_user
    @user = current_user
  end
end
