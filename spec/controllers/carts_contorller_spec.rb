require 'rails_helper'

RSpec.describe CartsController do
  describe 'GET #show' do
    before { get :show }

    it 'renders :show template' do
      expect(response).to render_template :show
    end

    it 'responds successfully with an HTTP 200 status code' do
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it 'assigns @order' do
      expect(assigns(:order)).not_to be_nil
    end

    it 'assigns @order_items' do
      expect(assigns(:order_items)).not_to be_nil
    end
  end
end
