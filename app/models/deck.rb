class Deck < ApplicationRecord
  has_many :cards, dependent: :destroy
  has_many :lessons
  belongs_to :user

  validates :name, :description, presence: true, format: /\w{2,}/

  def number_of_cards
    cards.count
  end
end
