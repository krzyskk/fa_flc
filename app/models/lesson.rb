# frozen_string_literal: true

class Lesson < ApplicationRecord
  NUMNBER_OF_QUESTIONS = 20
  DISPLAY_ANSWERS = 3

  belongs_to :deck
  has_many :questions, dependent: :destroy

  scope :ongoing, -> { joins(:questions) }

  def recent_questions
    questions.last(4).first(3)
  end

  def recent_question
    questions.last(2).first
  end

  def next_question
    questions.where(card_id: next_card_id).first
  end

  def next_card_id
    cards_package = deck.cards.where(active: true, memorized: false)
                        .order(last_showed_at: :asc).limit(10)
    if recent_question.status == 'correct'
      srand
      number = rand(cards_package.count)
      cards_package[number].id
    else
      recent_question.card_id
    end
  end

  def number_of_memorized
    questions.joins(:card).where(cards: { status: 2 } ).count
  end
end
