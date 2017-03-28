require 'rails_helper'

RSpec.describe BooksController do
  describe 'GET #index' do
    before { get :index }
    it 'renders :index template' do
      expect(response).to render_template :index
    end

    it 'responds successfully with an HTTP 200 status code' do
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it 'assigns @books' do
      expect(assigns(:books)).not_to be_nil
    end

    it 'calls default scope' do
      expect(Book.all.to_sql).to eql(Book.order(title: :asc).to_sql)
    end
  end

  describe 'GET #show' do
    let(:book) { create(:book) }
    before { get :show, params: { id: book.id } }

    it 'renders :show template' do
      expect(response).to render_template :show
    end

    it 'responds successfully with an HTTP 200 status code' do
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it 'assigns @book' do
      expect(assigns(:book)).not_to be_nil
    end
  end
end
