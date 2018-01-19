class Answer < ApplicationRecord
  belongs_to :lesson
  belongs_to :card

  def question
    Card.find(card.id).front
  end

  def correct_answer
    Card.find(card.id).back
  end

end
