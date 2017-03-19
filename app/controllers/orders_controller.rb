# :nodoc:
class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_variables, only: :index

  def index
    state = OrdersState.find_by(name: @state_order)
    @orders = Order.where('user': current_user, 'orders_state': state)
  end

  def show
    @order = Order.find_by(id: params[:id])
    redirect_to(books_path) && return if @order.nil?
    @user = User.find_by(id: @order.user)
    @orders = @order.items
    @orders.each(&:symbolize_keys!)
    @shipping = @user.shipping_address
    @billing = @user.billing_address
  end

  private

  def set_variables
    @states_names_list = OrdersState.pluck(:name)
    @state_order = params[:sort_by] || @state_order || @states_names_list.first
  end
end
