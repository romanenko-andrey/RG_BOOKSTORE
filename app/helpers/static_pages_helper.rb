# :nodoc:
module StaticPagesHelper
  def active(first_book_id, book)
    'active' if book && first_book_id == book.id
  end
end
