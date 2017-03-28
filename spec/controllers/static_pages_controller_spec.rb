require 'rails_helper'

RSpec.describe PagesController do
  describe 'GET #home' do
    before { get :home }

    it 'renders :home template' do
      expect(response).to render_template :home
    end

    it 'responds successfully with an HTTP 200 status code' do
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it 'assigns @books' do
      expect(assigns(:books)).not_to be_nil
    end

    it 'assigns @latest_books' do
      expect(assigns(:latest_books)).not_to be_nil
    end

    it 'assigns @bestsellers' do
      expect(assigns(:bestsellers)).not_to be_nil
    end
  end
end
