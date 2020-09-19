# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Card, type: :model do
  subject { build(:card) }
  it { is_expected.to be_valid }

  describe 'associations' do
    it { is_expected.to belong_to(:deck) }
    it { is_expected.to have_many(:answers).dependent(:destroy) }
  end

  describe 'validations' do
    it { should validate_presence_of(:front) }
    it { should validate_presence_of(:back) }

    it 'front shouldn\'t be shorter than 2 chars' do
      card = Card.new(front: 'aa')
      expect(card).to be_invalid
    end

    it 'back shouldn\'t be shorter than 2 chars' do
      card = Card.new(back: 'aa')
      expect(card).to be_invalid
    end
  end
end
