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

  def next_card_id
    if self.last_answer.status == 'correct'
      srand
      number = rand(deck.cards_package.count)
      return self.deck.cards_package[number].id
    else
      return self.last_answer.card_id
    end
    next_card
    binding.pry
  end

  private

  def init_answers
    4.times do
      self.answers.create(card_id: Card.where(deck_id: deck_id).first.id)
    end
  end
end
