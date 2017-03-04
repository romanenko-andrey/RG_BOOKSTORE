class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :get_variables, only: :index

  def index
    @orders = Order.where('user': current_user, 'state': @state_order)
  end

  def show
    @order = Order.find(params[:id])
    @orders = @order.items
    @user = User.find(@order.user)
    @shipping = @user.shipping_address
    @billing = @user.billing_address
  end

  private

  def get_variables
    @states_names_list = ['in_progress', 'in_queue', 'in_delivery', 'delivered', 'canceled' ]
    @state_order = params[:sort_by] || @state_order || @states_names_list.first
  end
end
