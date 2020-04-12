# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Deck, type: :model do
  let!(:deck) { create(:deck) }
  subject { deck }

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

  describe '#sample_words' do
    let(:front) { 'Front' }
    let!(:card) { create(:card, deck: deck, front: front) }

    it { expect(subject.sample_words).to match(front) }
  end
end
