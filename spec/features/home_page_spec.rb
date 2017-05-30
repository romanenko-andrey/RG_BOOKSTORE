require 'rails_helper'
include Support::UserAuth
include Support::LoadDataBase

feature 'HomePage of Bookstore App', type: :feature do
  before :all do
    bookstore_initialisation
  end

  context 'home page' do
    before { visit root_path }

    it 'displays Welcome invitation' do
      expect(page).to have_content 'Welcome to our amazing Bookstore!'
    end

    scenario 'displays LogIn & SignUp links when user is not logined now' do
      expect(page).to have_current_path root_path
      expect(page).to have_content 'Log In'
      expect(page).to have_content 'Sign Up'
    end

    context 'have GetStarted button' do
      it 'it is link to Shop page' do
        expect(page).to have_link('Get Started')
      end

      it 'and redirect to ShopPage when click it' do
        click_link('Get Started')
        expect(page).to have_current_path "#{books_path}?category=All"
        expect(page).to have_content 'Catalog'
      end
    end
  end

  context 'when user signed' do
    before :all do
      sign_in create(:user)
    end

    scenario 'My account & Orders links are visible' do
      visit root_path
      expect(page).to have_current_path root_path
      expect(page).to have_content 'My account'
      expect(page).to have_content 'Orders'
    end
  end

  context '' do
    before { visit root_path }
  end
end
