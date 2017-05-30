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
    order_update
  end

  def orders_params
    delivery = @shipping_list[@cart[:delivery].to_i]
    {
      user: @user, number: generate_order_number, items: @orders,
      discont: @cart[:coupon], delivery_methods: delivery.first,
      delivery_cost: delivery.last, total_cost: @total
    }
  end

  def order_update
    @orders.each(&:stringify_keys!)
    if @order.update(orders_params)
      flash[:notice] = I18n.t('checkout.new_order.success')
      session['cart']['finished'] = true
      session['last_order'] = @order.id
    else
      flash[:error] = I18n.t('checkout.new_order.error')
    end
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
    delivery = @shipping_list[@cart[:delivery].to_i]
    books_cost - @cart[:coupon].to_f + delivery.last.to_f
  rescue 
    books_cost - @cart[:coupon].to_f
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
