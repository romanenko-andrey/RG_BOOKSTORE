# :nodoc:
module ApplicationHelper
  MAX_SIZE_OF_SHORT_DESCRIPTION = 350

  def toEURO(value)
    "€#{format('%.2f', value.to_f)}"
  end

  def markdown_short(text)
    Maruku.new("#{text[0, MAX_SIZE_OF_SHORT_DESCRIPTION]}]...").to_html.html_safe
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
    authors.pluck(:first_name, :last_name).each do |author|
      result << author.join(' ')
    end
    result.join(', ')
  end

  def format_date(date)
    Time.at(date).utc.strftime('%d/%m/%y') if date
  end

  def format_date_to_YYYYMMDD(date)
    Time.at(date).utc.strftime('%Y-%m-%d') if date
  end

  def countries_select_options(id = nil)
    return Country.find_by(id: id) if id
    Country.all.map { |land| ["#{land.name} (#{land.zip})", land.id] }
  end

  def books_in_cart
    session['cart'].symbolize_keys[:orders].count.to_s
  rescue
    '0'
  end

  def field_class_when_error(flash_name, field_name)
    errors = flash[flash_name]
    return ''.html_safe if errors.nil?
    'has-error'.html_safe if errors[field_name.to_s]
  end

  def show_error_message(form_name, field_name)
    errors = flash[form_name]
    'collapse'.html_safe if errors.nil? || errors[field_name.to_s].nil?
  end
end
