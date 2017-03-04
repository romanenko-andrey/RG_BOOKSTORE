class CartsController < ApplicationController
  #before_action :authenticate_user!
  before_action :set_cart
  before_action :find_cart_position, only: [:update, :destroy]
  after_action :save_cart, only: [:update]

  def index
    @orders.each do |order| 
      book = Book.find(order["id"])
      order["price"] = book.price
      order["name"] = book.name
      order["photo"] = book.title_photo
      order["short_description"] = book.short_description
    end
  end

  def show
    redirect_to carts_path
  end

  def create
    @cart['coupon'] = params[:coupon].to_f
    flash[:notice] = 'Coupon have successfully updated.' 
  rescue
    flash[:alert] = 'Coupon number is incorrect!'   
  ensure
    redirect_to carts_path
  end

  def update
    case 
    when cart_add_params['sum']
      add_book_to_cart 
      redirect_to books_path, notice: 'Book have successfully added.'
    when cart_change_params['change']
      change_books_number
      redirect_to carts_path, notice: 'Count of book have successfully changed.' 
    when params[:del]
      destroy
      redirect_to carts_path, notice: 'The book have successfully deleted.'
    end
  end

  def destroy
    @orders.delete_at(@pos)
  end



  private

  def set_cart
    #byebug
    @cart = session['cart'] || {}
    @cart['orders'] ||= []
    @orders = @cart['orders']
    @cart['coupon'] ||= '0.00'
  end

  def find_cart_position
    @pos = @orders.index{ |order| order['id'] == params[:id] }
    @order = @pos && @orders[@pos]
  end

  def change_books_number
    @order['sum'] = @order['sum'].to_i + cart_change_params[:change].to_i
    @order['sum'] = 0 if @order['sum'] < 0
  end

  def add_book_to_cart
    if @pos
      @order['sum'] = @order['sum'].to_i + cart_add_params[:sum].to_i
    else
      @orders << cart_add_params
    end
  end

  def save_cart
    session['cart'] = @cart
  end
  
  def cart_add_params
    params.slice(:id, :sum).permit(:id, :sum)
  end

  def cart_change_params
    params.slice(:id, :change).permit(:id, :change)
  end
end