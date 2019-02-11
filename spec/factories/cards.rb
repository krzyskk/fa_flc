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

FactoryBot.define do
  factory :card do
    active { true } 
    back { 'Back' }
    correct_answers { 0 }
    empty_answers { 0 }
    front { 'Front' }
    last_correct_answer { rand(1..100).days.from_now }
    last_showed_at { rand(1..100).days.from_now }
    last_wrong_answer { rand(1..100).days.from_now }
    marked_as_memorized { rand(1..100).days.from_now }
    memorized { false }
    word_class { 0 }
    wrong_answers { 0 }
    deck
  end
end
