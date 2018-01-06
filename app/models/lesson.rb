class Lesson < ApplicationRecord
  belongs_to :deck
  has_many :questions
  has_many :answers

  def number_of_answers
    correct_answers + wrong_answers
  end
end
