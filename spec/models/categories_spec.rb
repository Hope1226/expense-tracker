require 'rails_helper'

RSpec.describe Group, type: :model do
  let(:user) do
    User.create!(name: 'Hope', email: 'hope@test.com', password: '123456')
  end
  subject do
    Group.create!(user: user, name: 'Testing', icon: 'icontype')
  end

  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'icon shoul be should be present' do
    subject.icon = nil
    expect(subject).to_not be_valid
  end

  it 'calculate total method shoul return the sum of all transaction for particular group' do
    Entity.create!(group: subject, user: user, name: 'test transactions-1', amount: 10)
    Entity.create!(group: subject, user: user, name: 'test transactions-2', amount: 10)
    Entity.create!(group: subject, user: user, name: 'test transactions-3', amount: 10)
    Entity.create!(group: subject, user: user, name: 'test transactions-4', amount: 10)
    Entity.create!(group: subject, user: user, name: 'test transactions-5', amount: 10)
    Entity.create!(group: subject, user: user, name: 'test transactions-6', amount: 10)
    expect(subject.calculate_total).to be(60)
  end
end
