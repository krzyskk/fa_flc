# frozen_string_literal: true

class Card < ApplicationRecord
  enum status: { newly_created: 0, not_memoized: 1,  memorized: 2, confirmed: 3, suspended: 4 }

  validates :front, :back, presence: true

  has_many :answers, dependent: :destroy
  belongs_to :deck

  def set_memorized
    if answers.where(status: 'correct').count >= 3
      self.memorized = true
      self.marked_as_memorized = DateTime.now
      self.save!
      deck.lessons.first.increment!('memorized')
    end
  end
end
