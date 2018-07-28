require 'rails_helper'

RSpec.describe Deck, type: :model do
  subject { build(:deck) }

  it 'has a working factory' do
    create :deck
    comment = create :deck
    expect(comment).to be_valid
  end

  describe 'associations' do
    it { is_expected.to belong_to(:user) }
    it { is_expected.to have_many(:cards).dependent(:destroy) }
    it { is_expected.to have_many(:lessons) }

  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:description) }
  end
end
