require 'rails_helper'
require_relative '../support/controller_auth'

RSpec.describe ExpensesController, type: :controller do
  extend ControllerAuth
  let(:user) { create(:user) }
  let(:category) { create(:category, user:) }
  let(:expense) { create(:expense, category:, user:) }
  describe 'GET /index' do
    login_user
    it 'returns http success' do
      get :index, params: { category_id: category.id, user_id: user.id }
      expect(response).to have_http_status(:success)
    end

    it 'should have text: "Transaction"' do
      get :index, params: { category_id: category.id, user_id: user.id }
      expect(response.body).to include('Transaction')
    end
  end

  describe '#new' do
    login_user
    it 'assigns @expense' do
      get :new, params: { category_id: category.id, user_id: user.id }
      expect(controller.instance_variable_get(:@expense)).to be_a_new(Expense)
    end
  end

  describe '#create' do
    context 'when expense is valid' do
      login_user
      it 'creates a new expense' do
        expect do
          post :create, params: { category_id: category.id, expense: attributes_for(:expense) }
        end.to change(Expense, :count).by(1)
      end

      it 'sets the flash notice message' do
        post :create, params: { category_id: category.id, expense: attributes_for(:expense) }
        expect(flash[:notice]).to eq('Expense was successfully created!')
      end

      it 'redirects to categories index page' do
        post :create, params: { category_id: category.id, expense: attributes_for(:expense) }
        expect(response).to redirect_to(category_expenses_path)
      end
    end

    context 'when expense is Invalid' do
      login_user
      it 'does not creates a new expense' do
        expect do
          post :create, params: { category_id: category.id, expense: attributes_for(:expense, name: nil) }
        end.to change(Expense, :count).by(0)
      end

      it 'sets the flash notice message' do
        post :create, params: { category_id: category.id, expense: attributes_for(:expense, name: nil) }
        expect(flash[:alert]).to eq('Expense could not be created!')
      end

      it 'redirects to categories index page' do
        post :create, params: { category_id: category.id, expense: attributes_for(:expense, name: nil) }
        expect(response).to redirect_to(category_expenses_path)
      end
    end
  end
end
