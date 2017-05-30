require 'rails_helper'

feature 'Show book', type: :feature do
  before :all do
    Category.create! name: 'Mobile development'
    create(:book)
  end

  let(:book) { Book.first }
  
  before :each do
    visit book_path(id: book.id)
  end

  scenario 'Must show book attributes' do
    expect(page).to have_content(book.name)
    expect(page).to have_content(book.price)
    expect(page).to have_content(book.authors.first.first_name)
    expect(page).to have_content(book.public_year)
    expect(page).to have_content(book.dimensions)
    expect(page).to have_content(book.materials)
  end

  scenario "Can show/hide full book's description" do
    byebug
    expect(page).to have_selector('#short_descr', visible: true)
    expect(page).to have_selector('#long_descr', visible: false)
    find_link('Read More').click
    expect(page).to have_selector('#short_descr', visible: false)
    expect(page).to have_selector('#long_descr', visible: true)
    find_link('Hide Info').click
    expect(page).to have_selector('#short_descr', visible: true)
    expect(page).to have_selector('#long_descr', visible: false)
  end
end