# rubocop:disable Metrics/BlockLength
require 'rails_helper'
require 'capybara/rspec'

RSpec.feature 'Category index page for User', type: :feature do
  before :each do
    @current_user = User.create(name: 'Hope', email: 'test@test.com', password: '123456')
    @current_user.groups.create(name: 'test-category-1', icon: 'icon-1')
    @current_user.groups.create(name: 'test-category-2', icon: 'icon-2')
    @current_user.groups.create(name: 'test-category-3', icon: 'icon-3')
    @current_user.groups.create(name: 'test-category-4', icon: 'icon-4')
    @current_user.groups.create(name: 'test-category-5', icon: 'icon-5')
  end
  describe 'when vising main page', type: :feature do
    before :each do
      visit '/users/sign_in'
      fill_in 'Email', with: 'test@test.com'
      fill_in 'Password', with: '123456'
      click_button 'Log in'
    end

    it 'Main heading is avialiable' do
      expect(page).to have_content 'Categories'
    end

    it 'Should have wellcoming message' do
      expect(page).to have_content 'Wellcome back, Hope!'
    end

    it 'Should have main dashboard with the text total spending for period' do
      expect(page).to have_content 'Total spending for current period:'
    end

    it 'Should have main dashboard with the total spending for period' do
      expect(page).to have_content '$ 0.00'
    end

    it 'Should list all added categories' do
      expect(page).to have_content 'test-category-1'
    end
  end
end
# rubocop:enable Metrics/BlockLength
