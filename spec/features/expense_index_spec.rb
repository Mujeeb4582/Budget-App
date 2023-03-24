require 'rails_helper'

RSpec.feature 'ExpenseIndices', type: :feature do
  let(:user) { create(:user) }
  let(:category) { create(:category, user:) }

  before do
    user.confirm # Confirm the user's email address
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
    expect(page).to have_text('Signed in successfully.')
  end

  describe 'Index page' do
    it 'can see the Transaction text on the page' do
      visit category_expenses_path(category)
      expect(page).to have_content('Transaction')
    end

    it 'can click on the "Add a new transaction" button' do
      visit category_expenses_path(category)
      click_link 'Add a new transaction'
      expect(page).to have_current_path(category_expenses_path(category))
    end
  end

  describe 'New transaction page' do
    it 'can add a new transaction' do
      visit new_category_expense_path(category)
      fill_in 'Name', with: 'Pizza'
      fill_in 'Amount', with: 200
      click_button 'Save'
      expect(page).to have_content('Expense was successfully created!')
    end
  end
end
