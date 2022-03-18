require 'rails_helper'
require 'capybara/rspec'

RSpec.feature 'Post show page for User', type: :feature do
  before :each do
    @current_user = User.create(name: 'Hope', email: 'test@test.com', password: '123456')
    @current_group = Group.create(user: @current_user, name: 'test-category-1', icon: 'icon-1')
    @current_group.entities.create!(user: @current_user, name: 'test-entity-2', amount: 10)
    @current_group.entities.create!(user: @current_user, name: 'test-entity-3', amount: 10)
    @current_group.entities.create!(user: @current_user, name: 'test-entity-4', amount: 10)
    @current_group.entities.create!(user: @current_user, name: 'test-entity-5', amount: 10)
  end
  describe 'when specific category page', type: :feature do
    before :each do
      visit '/users/sign_in'
      fill_in 'Email', with: 'test@test.com'
      fill_in 'Password', with: '123456'
      click_button 'Log in'
      visit "/categories/#{@current_group.id}"
    end

    it 'Main heading is avialiable' do
      expect(page).to have_content @current_group.name
    end

    it 'Should have teh total spending for current group' do
      expect(page).to have_content @current_group.calculate_total
    end

    it 'Should list all added categories' do
      expect(page).to have_content 'test-entity-2'
    end

    it 'Should list the amoun for each entity' do
      expect(page).to have_content '10'
    end
  end
end
