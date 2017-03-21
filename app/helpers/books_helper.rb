# :nodoc:
module BooksHelper
  def first_page?
    Book.page(params[:page]).first_page?
  end

  def user_first_letter(note)
    return note.user.name.first if note.user.name
    note.user.email.first
  end

  def user_name(note)
    note.user.name || note.user.email
  end

  def checked(note)
    case note.status
    when 'approved' then 'Verified Reviewer'
    when 'rejected' then 'Blocked messages'
    else
      'Not-verified Reviewer'
    end
  end

  def verified(note)
    true if note.status == 'approved'
  end

  def title_photo(book)
    book.photos.first.file.url
  end

  def book_photo(book, pos)
    img = book.photos
    pos >= img.count ? img.first.file.url : img[pos].file.url
  end

  def category
    session[:category]
  end

  def sort_method
    session[:sort]
  end
end
