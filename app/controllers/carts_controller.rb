# :nodoc:
class CartsController < ApplicationController
  before_action :set_cart
  before_action :set_orders
  before_action :find_cart_position, only: [:update, :destroy]
  after_action  :save_cart, only: [:update, :create]

  def index; end

  def show
    redirect_to carts_path
  end

  def create
    @cart[:coupon] = params[:coupon].to_f
    flash[:notice] = I18n.t('carts.create.success')
  rescue
    flash[:alert] = I18n.t('carts.create.error')
  ensure
    redirect_to carts_path
  end

  def update
    if add_cart?
      redirect_to books_path, notice: I18n.t('carts.update.success.book_add')
    elsif book_count_changed?
      redirect_to carts_path, notice: I18n.t('carts.update.success.change_sum')
    elsif delete_book?
      redirect_to carts_path, notice: I18n.t('carts.update.success.delete')
    end
  end

  private

  def delete_book?
    @orders.delete_at(@pos) if params[:del]
  end

  def set_cart
    @cart = session['cart'] || {}
    @cart.symbolize_keys!
    @cart[:orders] ||= []
    @cart[:coupon] ||= '0.00'
  end

  def set_orders
    @orders = @cart[:orders]
    @orders.each do |order|
      order.symbolize_keys!
      book = Book.find(order[:id])
      order[:price] = book.price
      order[:name] = book.name
      order[:photo] = book.photos.first.file.url
      order[:short_description] = book.short_description
    end
  end

  def find_cart_position
    @pos = @orders.index { |order| order[:id] == params[:id] }
    @order = @pos && @orders[@pos]
  end

  def add_book_to_cart
    if @pos
      @order[:sum] = @order[:sum].to_i + cart_add_params[:sum].to_i
    else
      @orders << cart_params
    end
  end

  def save_cart
    session['cart'] = @cart
  end

  def cart_params
    params.slice(:id, :sum).permit(:id, :sum)
  end

  def add_cart?
    add_book_to_cart if cart_params[:sum]
  end

  def book_count_changed?
    return unless params[:change]
    rez = @order[:sum]
    rez = rez.to_i + params[:change].to_i
    @order[:sum] = rez < 0 ? 0 : rez
  end
end
