require 'rails_helper'
require_relative '../support/controller_auth'

RSpec.describe CategoriesController, type: :controller do
  extend ControllerAuth
  let(:user) { create(:user) }
  let(:category) { create(:category, user:) }
  describe 'GET /index' do
    login_user
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end

    it 'should have text: "Categories"' do
      get 'index'
      expect(response.body).to include('Categories')
    end
  end

  describe '#new' do
    login_user
    it 'assigns @category' do
      get :new
      expect(controller.instance_variable_get(:@category)).to be_a_new(Category)
    end
  end

  describe '#create' do
    context 'when category is valid' do
      login_user
      it 'creates a new category' do
        expect do
          post :create, params: { category: attributes_for(:category) }
        end.to change(Category, :count).by(1)
      end

      it 'sets the flash notice message' do
        post :create, params: { category: attributes_for(:category) }
        expect(flash[:notice]).to eq('Category was successfully created!')
      end

      it 'redirects to categories index page' do
        post :create, params: { category: attributes_for(:category) }
        expect(response).to redirect_to(categories_path)
      end
    end

    context 'when category is invalid' do
      login_user
      it 'does not create a new category' do
        expect do
          post :create, params: { category: attributes_for(:category, name: nil) }
        end.not_to change(Category, :count)
      end

      it 'sets the flash alert message' do
        post :create, params: { category: attributes_for(:category, name: nil) }
        expect(flash[:alert]).to eq('Category could not be created!')
      end

      it 'renders the new template' do
        post :create, params: { category: attributes_for(:category, name: nil) }
        expect(response).to redirect_to(categories_path)
      end
    end
  end
end
