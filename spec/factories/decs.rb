# frozen_string_literal: true

FactoryBot.define do
  factory :deck do
    name { 'DeckName' }
    description { 'Description' }
    user
  end
end
