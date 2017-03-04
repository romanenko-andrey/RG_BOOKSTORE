class BooksController < ApplicationController
  before_action :set_book, only: [:show]
  before_action :set_categories

  #before_action :authenticate_user!, except: [:index, :show ]
  #before_action :user_signed_in?, except: [:index, :show ]

  # GET /books
  def index
    @category = session[:category] = params[:category] || session[:category] || 'All'
    @sort_method = session[:sort] = params[:sort] || session[:sort] || 'Newest first'
    @books =  @category == '"All' ? Book : Category.find_by(name: @category).books
    @books = sort(@books).page(params[:page])
  rescue
    @category = 'All'
    @sort_method  = 'Newest first'
    @books = Book
    @books= sort(@books).page(params[:page])
  end

  # GET /books/1
  def show
    redirect_to root_path unless @book
  end

  def create
    byebug
    @note = Note.new(user: @current_user, book: @book)
    @note.update(note_params)
    redirect_to books_path, notice: 'Thanks for Review. It will be published as soon as Admin will approve it.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find_by(id: params[:id])
    end

    def sort(books)
      case @sort_method
      when 'Popular first'
        books.popular
      when 'Price: Low to hight'
        books.from_low_to_high_price
      when 'Price: Top to down'
        books.from_hight_to_low_price
      else
        books.newest
      end
    end

    def set_categories
      @categories_info = []
      @categories_info << {name: 'All', count:  Book.count}
      Category.all.each do |category|
        @categories_info << {name:  category.name, count: category.books.count}
      end
      @categories = Category.pluck(:name) 
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def book_params
      params.require(:book).permit(:name, :author, :price, :description, :demensions, :materials, :public_year, :photo1, :photo2, :photo3, :photo4, :title_photo, :alt)
    end

     def note_params
      params.permit(:rating, :text).to_h
    end

end
