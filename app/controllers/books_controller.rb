# :nodoc:
class BooksController < ApplicationController
  load_and_authorize_resource only: [:update, :show, :create]

  before_action :set_book, only: [:show, :create]
  before_action :set_user
  before_action :set_categories
  before_action :update_category
  before_action :update_sort_method

  def index
    @books = sort(books_by_category).page(params[:page])
  end

  def show
    redirect_to root_path unless @book
  end

  def create
    @note = Review.new(user: @user, book: @book)
    if @note.update(note_params)
      redirect_to books_path, notice: I18n.t('books.create.success')
    else
      flash[:error] = @note.errors.messages.join(' ,')
      redirect_to book_path(@book), alert: I18n.t('books.create.error')
    end
  end

  private

  def set_book
    @book = Book.find_by(id: params[:id])
  end

  def set_user
    @user = current_user
  end

  def sort(books)
    books.send(@sort_method)
  end

  def set_categories
    @categories_info = []
    @categories_info << { name: 'All', count: Book.count }
    Category.all.each do |category|
      @categories_info << { name: category.name, count: category.books.count }
    end
    @categories = Category.pluck(:name)
  end

  def current_category
    params[:category] || session[:category] || 'All'
  end

  def current_sort_method
    params[:sort] || session[:sort] || Book::SORT_METHODS.first
  end

  def books_by_category
    @category == 'All' ? Book : Category.find_by(name: @category).books
  end

  def update_category
    @category = session[:category] = current_category
  end

  def update_sort_method
    @sort_method = session[:sort] = current_sort_method
  end

  def book_params
    params.require(:book).permit(:name, :author, :price, :description,
                                 :demensions, :materials, :public_year,
                                 :photo1, :photo2, :photo3, :photo4,
                                 :title_photo, :alt)
  end

  def note_params
    params.permit(:rating, :text).to_h
  end
end
