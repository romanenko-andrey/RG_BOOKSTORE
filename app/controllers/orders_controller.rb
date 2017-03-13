class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :get_variables, only: :index

  def index
    state = OrdersState.find_by(name: @state_order)
    @orders = Order.where('user': current_user, 'orders_state': state)
  end

  def show
    @order = Order.find_by_id(params[:id])
    redirect_to books_path and return if @order.nil?
    @user = User.find_by_id(@order.user)
    @orders = @order.items
    @shipping = @user.shipping_address
    @billing = @user.billing_address
  end

  private

  def get_variables
    @states_names_list =  OrdersState.pluck(:name)
    # ['in_progress', 'in_queue', 'in_delivery', 'delivered', 'canceled' ]
    @state_order = params[:sort_by] || @state_order || @states_names_list.first
  end
end
