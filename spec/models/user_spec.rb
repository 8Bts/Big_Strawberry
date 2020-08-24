require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    User.create(name: 'test_name')
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
  end

  it 'is valid when name is not blank' do
    subject.name = 'Joe'
    expect(subject).to be_valid
  end

  it 'is invalid when name is blank' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  describe 'Associations' do
    it { should have_many(:articles) }
    it { should have_many(:votes) }
  end
end
