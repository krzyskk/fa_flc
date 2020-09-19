# frozen_string_literal: true

FactoryBot.define do
  factory :card do
    active { true }
    back { 'Back' }
    empty_answers { 0 }
    front { 'Front' }
    marked_as_memorized { rand(1..100).days.from_now }
    memorized { false }
    wrong_answers { 0 }
    deck
  end
end
