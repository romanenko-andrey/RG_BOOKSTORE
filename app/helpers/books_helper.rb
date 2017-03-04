module BooksHelper
  def first_page?
    Book.page(params[:page]).first_page?
  end
end
