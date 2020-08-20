require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    User.create(name: 'test_name')
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name).is_at_most(20) }
  end

  it 'is valid when name is not blank' do
    subject.name = 'Joe'
    expect(subject).to be_valid
  end

  it 'is invalid when name is blank' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'is valid when name length is less than 20' do
    subject.name = 'Trevor'
    expect(subject).to be_valid
  end

  it 'is invalid when name length is greater than 20' do
    subject.name = 'Adjfjfjfjfjfjfjfjfjfjfjffffffffff'
    expect(subject).to_not be_valid
  end

  describe 'Associations' do
    it { should have_many(:friendships) }
    it { should have_many(:recieved_friendships).class_name('Friendship') }
    it { should have_many(:mutual_friendships).class_name('Friendship') }
    it { should have_many(:friends).through(:mutual_friendships) }
    it { should have_many(:pending_friends).through(:requested_friendships).source(:friend) }
    it { should have_many(:friendship_requests).through(:recieved_friendships).source(:user) }

    it { should have_many(:posts) }
    it { should have_many(:comments) }
  end

end
