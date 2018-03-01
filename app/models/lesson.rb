class Lesson < ApplicationRecord
  belongs_to :deck
  has_many :answers
  after_create :init_answers

  def correct_answers
    answers.where(status: 'correct').count
  end

  def wrong_answers
    answers.where(status: 'wrong').count
  end

  def empty_answers
    answers.where(status: 'empty').count
  end

  def last_answers
    answers.offset(1).last(3)
  end

  def last_answer
    answers.offset(1).last
  end

  def cards_package
    deck.cards.all.where(active: true).where(memorized: false).order(last_correct_answer: :asc).limit(10)
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

  def init_answers
    4.times do
      answers.create(card_id: Card.where(deck_id: deck_id).first.id)
    end
  end
end
