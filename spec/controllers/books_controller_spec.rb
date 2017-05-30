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
      expect(Book.all.to_sql).to eql(Book.order(name: :asc).to_sql)
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

  describe 'POST #create' do
    let(:user) { FactoryGirl.create(:user) }
    let(:book) { FactoryGirl.create(:book) }
    let(:review_params) { FactoryGirl.attributes_for(:review) }
 
    context 'without user in params' do
      before do
        allow(controller).to receive(:current_user).and_return nil
        post :create, params: { id: book.id, rating: review_params[:rating], text: review_params[:text] }
      end

      it 'redirects to book page' do
        expect(response).to redirect_to(book_path(book))
      end

      it 'sends error notice' do
        expect(flash[:alert]).to eq I18n.t('review.create.error')    
      end
    end

    context 'success new messages to book for user' do
      before do
        allow(controller).to receive(:current_user).and_return user
        post :create, params: { id: book.id, rating: review_params[:rating], text: review_params[:text] }
      end

      it 'redirects to root page' do
        expect(response).to redirect_to(books_path)
      end

      it 'sends notice' do
        expect(flash[:notice]).to eq I18n.t('review.create.success')
      end
    end
  end
end
