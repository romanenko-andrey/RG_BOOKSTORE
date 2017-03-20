# :nodoc:
class BooksController < ApplicationController
  load_and_authorize_resource only: [:update, :show, :create]

  before_action :set_book, only: [:show, :create]
  before_action :update_category
  before_action :update_sort_method

  def index
    @books = sorted_books.page(params[:page])
  end

  def show
    redirect_to root_path unless @book
  end

  def create
    note = Review.new(user: current_user, book: @book)
    if note.update(note_params)
      redirect_to books_path, notice: I18n.t('books.create.success')
    else
      flash[:error] = note.errors.messages.join(' ,')
      redirect_to book_path(@book), alert: I18n.t('books.create.error')
    end
  end

  private

  def set_book
    @book = Book.find_by(id: params[:id])
  end

  def books_by_category
    return Book if session[:category] == 'All'
    Category.find_by(name: session[:category]).books
  end

  def sorted_books
    books_by_category.send(session[:sort])
  end

  def update_category
    session[:category] = params[:category] || session[:category] || 'All'
  end

  def update_sort_method
    session[:sort] = params[:sort] || session[:sort] || Book::SORT_METHODS.first
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
