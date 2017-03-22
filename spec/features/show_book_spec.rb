require 'rails_helper'

feature 'Show book' do
  let(:book) { create(:book) }
  background do
    visit book_path(id: book.id)
  end

  scenario 'Must show book attributes' do
    byebug
    expect(page).to have_content(book.name)
    expect(page).to have_content(book.price)
    expect(page).to have_content(book.authors.first.first_name)
    expect(page).to have_content(book.public_year)
    expect(page).to have_content(book.dimensions)
    expect(page).to have_content(book.materials)
  end

  scenario "Show full book's description", js: true do
    visit book_path(id: book.id)
    page.should have_css('#short_descr')
    page.should have_no_css('#long_descr')
    find_link('Read More').click
    page.should have_no_css('#short_descr')
    page.should have_css('#long_descr')
    find_link('Hide Info').click
    page.should have_css('#short_descr')
    page.should have_no_css('#long_descr')
  end
end