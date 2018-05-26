class Lesson < ApplicationRecord
  belongs_to :deck
  has_many :answers, dependent: :destroy, after_add: :update_counters
  after_create :init_answers

  def last_answers
    answers.last(4).first 3
  end

  def last_answer
    answers.last(2).first
  end

  def cards_package
    deck.cards.where(active: true).where(memorized: false).order(last_correct_answer: :asc).limit(10)
  end

  def next_card_id
    if last_answer.status == 'correct'
      srand
      number = rand(cards_package.count / 2)
      cards_package.order(last_correct_answer: :asc)[number].id
    else
      last_answer.card_id
    end
  end

  private

  def update_counters(_answer)
    update_attribute(:correct, answers.where(status: 'correct').count)
    update_attribute(:wrong, answers.where(status: 'wrong').count)
    update_attribute(:empty, answers.where(status: 'empty').count)
  end

  def init_answers
    4.times do
      answers.create(card_id: Card.where(deck_id: deck_id).first.id)
    end
  end
end
