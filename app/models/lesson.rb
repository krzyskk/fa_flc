class Lesson < ApplicationRecord
  belongs_to :deck
  has_many :answers

  def number_of_answers
    correct_answers + wrong_answers
  end

  def last_answers
    answers.offset(1).last(3)
  end

  def last_answer
    answers.offset(1).last
  end

  def next_card_id
    if answers.last.status == 'correct'
      srand
      number = rand(deck.cards_package.count)
      return deck.cards_package[number].id
    end
  end

end
