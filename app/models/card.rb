class Card < ApplicationRecord
  validates :front, :back, presence: true
  has_many :questions
  has_many :answers
end
