require 'rails_helper'

RSpec.describe CartsController do

  describe 'GET #index' do
    before { get :index }

    it 'renders :index template' do
      expect(response).to render_template :index
    end

    it 'responds successfully with an HTTP 200 status code' do
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it 'assigns @cart' do
      expect(assigns(:cart)).not_to be_nil
    end

    it 'assigns @orders' do
      expect(assigns(:oprers)).not_to be_nil
    end
  end

  describe 'GET #show' do
    before { get :show }

    it 'redirects to index page' do
      expect(response).to redirect_to(carts_path)
    end
  end
end
