class Deck < ApplicationRecord
  has_many :cards, dependent: :destroy
  has_many :lessons
end
