# frozen_string_literal: true

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
