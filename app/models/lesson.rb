# frozen_string_literal: true

class Lesson < ApplicationRecord
  belongs_to :deck
  has_many :answers, dependent: :destroy

  def last_answers
    answers.last(4).first 3
  end

  def last_answer
    answers.last(2).first
  end

  def next_card_id
    cards_package = deck.cards.where(active: true, memorized: false)
                        .order(last_showed_at: :asc).limit(10)
    if last_answer.status == 'correct'
      srand
      number = rand(cards_package.count)
      cards_package[number].id
    else
      last_answer.card_id
    end
  end

  def number_of_correct
    answers.where(status: 'correct').count
  end

  def number_of_wrong
    answers.where(status: 'wrong').count
  end

  def number_of_empty
    answers.where(status: 'epmoty').count
  end

  def number_of_memorized
    initial_cards_package.size - current_cards_package.size
  end
end
