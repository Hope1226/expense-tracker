# rubocop:disable Metrics/BlockLength
require 'rails_helper'
require 'capybara/rspec'

RSpec.feature 'Transactions show page for User', type: :feature do
  before :each do
    @current_user = User.create(name: 'Hope', email: 'test@test.com', password: '123456')
    @current_group = Group.create(user: @current_user, name: 'test-category-1', icon: 'icon-1')
    @current_entity = Entity.create(user: @current_user, group: @current_group, name: 'test-entity-2', amount: 10)
  end
  describe 'when specific category page', type: :feature do
    before :each do
      visit '/users/sign_in'
      fill_in 'Email', with: 'test@test.com'
      fill_in 'Password', with: '123456'
      click_button 'Log in'
      visit "/categories/#{@current_group.id}/transactions/#{@current_entity.id}"
    end

    it 'Main heading is avialiable' do
      expect(page).to have_content 'Details'
    end

    it 'Should have transaction name' do
      expect(page).to have_content @current_entity.name
    end

    it 'Should have transaction number' do
      expect(page).to have_content "10000#{@current_entity.id}"
    end

    it 'Should have transaction creation date' do
      expect(page).to have_content @current_entity.created_at.strftime('%d %B, %Y at %I:%M%p').to_s
    end

    it 'Should have the text total spending' do
      expect(page).to have_content 'Total spending'
    end

    it 'Should have the actual sum of spending' do
      expect(page).to have_content "#{@current_entity.amount}.00"
    end
  end
end
# rubocop:enable Metrics/BlockLength
