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
    note.checked? ? 'Verified Reviewer' : 'Not-verified Reviewer'
  end
end
