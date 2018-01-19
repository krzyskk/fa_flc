class Lesson < ApplicationRecord
  belongs_to :deck
  has_many :questions
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

end
