module ApplicationHelper
  MaxSizeOfShortDescriptions  = 350
 
  def toEURO(value)
    "€#{sprintf('%.2f', value.to_f)}"
  end

  def markdown_short(text)
    Maruku.new("#{text[0, MaxSizeOfShortDescriptions]}...").to_html.html_safe 
  end

  def markdown_text(text)
    Maruku.new(text).to_html.html_safe 
  end

  def full_name(user)
    user.first_name + ' ' + user.last_name
  rescue
    ''
  end

  def authors_to_string(authors)
    result = []
    authors.pluck(:first_name, :last_name).each{ |author| result << author.join(' ')}
    result.join(', ')
  end

  def format_date(date)
     Time.at(date).utc.strftime("%d/%m/%y") if date
  end

  def format_date_to_YYYYMMDD(date)
     Time.at(date).utc.strftime("%Y-%m-%d") if date
  end

  def countries_select_options(id = nil)
    id ? Country.find_by_id(id) : Country.all.map{|c| ["#{c.name} (#{c.zip})", c.id] }
  end

  def books_in_cart
    session['cart']['orders'].count.to_s
  rescue
    '0'
  end

  def field_class_when_error(flash_name, field_name)
    errors = flash[flash_name]
    return "".html_safe if errors.nil?
    'has-error'.html_safe if errors["#{field_name}"]
  end

  def show_error_message(form_name, field_name)
    errors = flash[form_name]
    'collapse'.html_safe if errors.nil? || errors["#{field_name}"].nil?
  end
end
