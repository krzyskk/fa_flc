class Deck < ApplicationRecord
  has_many :cards, dependent: :destroy
  has_many :lessons
  belongs_to :user

  def number_of_cards
    cards.count
  end
end
