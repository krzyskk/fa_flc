class Answer < ApplicationRecord
  belongs_to :lesson
  belongs_to :card

  def question
    Card.find(card.id).front
  end

  def correct_answer
    Card.find(card.id).back
  end

  def status
    if  answer == Card.find(card.id).back
      return 'correct'
    elsif answer == ''
      return 'empty'
    else
      return 'wrong'
    end
  end

end
