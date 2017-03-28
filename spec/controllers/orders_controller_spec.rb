require 'rails_helper'

RSpec.describe OrdersController do
  let(:user) { create(:user) }
  before do
    user.orders << create(:order, :with_order_items)
    allow(controller).to receive(:current_user).and_return(user)
  end

  describe 'GET #index' do
    before { get :index }
    
    it 'renders :index template' do
      expect(response).to render_template :index
    end

    it 'responds successfully with an HTTP 200 status code' do
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it 'assigns @orders' do
      expect(assigns(:orders)).not_to be_nil
    end

    it 'calls scope' do
      expect(Order).to receive(:in_delivery)
      get :index, params: { in_delivery: 'true' }
    end
  end

  describe 'GET #show' do
    before { get :show, params: { id: user.orders.first.id } }

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

    it 'assigns @shipping_types' do
      expect(assigns(:shipping_types)).not_to be_nil
    end
  end

  describe 'PUT #update' do
    it 'updates the order'
  end
end
