require 'rails_helper'

RSpec.describe Group, type: :model do
  let(:user) do
    User.create!(name: 'Hope', email: 'hope@test.com', password: '123456')
  end
  let(:group) do
    Group.create!(user: user, name: 'Testing', icon: 'icontype')
  end
  subject do
    Entity.create!(group: group, user: user, name: 'test transactions-1', amount: 10)
  end

  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'icon shoul be should be present' do
    subject.amount = nil
    expect(subject).to_not be_valid
  end

  it 'amount shoul be integer higher or equal to 0' do
    subject.amount = -1
    expect(subject).to_not be_valid
  end
end
