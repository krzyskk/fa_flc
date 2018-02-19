class Deck < ApplicationRecord
  has_many :cards, dependent: :destroy
  has_many :lessons
  belongs_to :user


  def number_of_cards
    cards.count
  end

  def cards_package
    cards.all.where(active: true).where(memorized: false).limit(10)
  end


end
