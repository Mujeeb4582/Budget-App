require 'rails_helper'

RSpec.feature 'CategoryIndices', type: :feature do
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
    it 'can see the Categories text on the page' do
      visit categories_path
      expect(page).to have_content('Categories')
    end

    it 'can click on the "Add category" button' do
      visit categories_path
      click_link 'Add a new category'
      expect(page).to have_current_path(new_category_path)
    end
  end

  describe 'New category page' do
    it 'can add a new category' do
      visit new_category_path
      fill_in 'Name', with: category.name
      select category.icon, from: 'Icon'
      click_button 'Save'
      expect(page).to have_content('Category was successfully created!')
    end
  end
end
