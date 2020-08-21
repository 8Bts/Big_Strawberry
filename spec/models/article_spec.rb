require 'rails_helper'

RSpec.describe Article, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:text) }
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:image) }
  end

  describe 'Associations' do
    it { should belong_to(:author).class_name('User') }
    it { should have_and_belong_to_many(:categories) }
    it { should have_many(:votes).dependent(:destroy) }
  end
end
