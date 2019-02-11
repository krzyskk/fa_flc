# == Schema Information
#
# Table name: cards
#
#  id                  :bigint(8)        not null, primary key
#  active              :boolean          default(TRUE), not null
#  back                :string           default(""), not null
#  correct_answers     :integer          default(0), not null
#  empty_answers       :integer          default(0), not null
#  front               :string           default(""), not null
#  last_correct_answer :datetime
#  last_showed_at      :datetime
#  last_wrong_answer   :datetime
#  marked_as_memorized :datetime
#  memorized           :boolean          default(FALSE), not null
#  word_class          :integer          default("verb"), not null
#  wrong_answers       :integer          default(0), not null
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  deck_id             :bigint(8)
#
# Indexes
#
#  index_cards_on_deck_id                        (deck_id)
#  index_cards_on_front_and_back_and_word_class  (front,back,word_class) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (deck_id => decks.id)
#

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
    it { should validate_presence_of(:word_class) }

    it "front shouldn't be shorter than 2 chars" do
      card = Card.new(front: "aa")
      expect(card).to be_invalid
    end

    it "back shouldn't be shorter than 2 chars" do
      card = Card.new(back: "aa")
      expect(card).to be_invalid
    end
  end
end

