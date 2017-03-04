module StaticPagesHelper
  def active(first_book_id, book_id)
    'active' if first_book_id == book_id
  end
end
