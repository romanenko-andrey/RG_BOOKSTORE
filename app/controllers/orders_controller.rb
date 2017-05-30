# :nodoc:
class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_variables, only: :index

  def index
    @orders = Order.where(user: current_user)
    return if @state_order.to_sym == @states_names_list.first
    @orders = @orders.where(status: @state_order)
  end

  def show
    @order = Order.find_by(id: params[:id])
    redirect_to(books_path) && return if @order.nil?
    @user = User.find_by(id: @order.user)
    @orders = @order.items.map(&:symbolize_keys!)
  end

  private

  def set_variables
    @states_names_list =  Order.assm_states
    #OrdersState.pluck(:name)
    @state_order = params[:sort_by] || @state_order || @states_names_list.first
  end
end
