# :nodoc:
module OrderConcern
  extend ActiveSupport::Concern
  include Wicked::Wizard
  included do
    before_action :set_order
  end

  private

  def create_new_order?
    return unless @step == :confirm
    last_order = Order.where(user: @user, total_cost: @total).last
    if last_order
      session['last_order'] = last_order.id
      return
    end
    order_update_and_save
    flash[:notice] = I18n.t('checkout.new_order.success')
    session['cart']['finished'] = true
    session['last_order'] = @order.id
  end

  def orders_params
    {
      user: @user, number: generate_order_number, items: @orders,
      discont: @cart[:coupon], delivery_methods: @cart[:delivery].first,
      delivery_cost: @cart[:delivery].last, total_cost: @total,
      orders_state: OrdersState.find_by(name: 'in_progress')
    }
  end

  def order_update_and_save
    @orders.each(&:stringify_keys!)
    @order.update(orders_params)
    @order.save
  end

  def generate_order_number
    "R#{DateTime.now.to_i}"
  end

  def set_order
    if @step == :complete && session['last_order']
      load_existence_order
    else
      build_new_order
    end
    @total = calculate_totally_cost(@orders)
  rescue
    redirect_to carts_path
  end

  def load_existence_order
    @cart = {}
    @order = Order.find(session['last_order'])
    @orders = @order.items
    @address = @user.shipping_address
  end

  def build_new_order
    @cart = session['cart'].symbolize_keys
    @orders = @cart[:orders]
    @orders.each(&:symbolize_keys!)
    @cart[:credit_card] ||= {}
    @cart[:delivery] ||= []
    @order = Order.new(@cart[:credit_card].symbolize_keys!)
  end

  def calculate_totally_cost(orders)
    books_cost = orders.reduce(0) do |total, order|
      total + order[:sum].to_f * order[:price].to_f
    end
    books_cost - @cart[:coupon].to_f + @cart[:delivery].last.to_f
  end

  def save_cart
    cart = session['cart']
    session['cart'] = if cart && (cart['finished'] == true)
                        {}
                      else
                        @cart
                      end
  end
end
