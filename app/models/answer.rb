class Answer < ApplicationRecord
  belongs_to :lesson
  belongs_to :card

  before_update :set_status, :update_card_counters

  def question
    Card.find(card.id).front
  end

  def correct_answer
    Card.find(card.id).back
  end

  private

  def set_status
    if answer == self.correct_answer
      self.status = 'correct'
    elsif answer == ''
      self.status = 'empty'
    else
      self.status = 'wrong'
    end
  end

  def update_card_counters
    Card.find(card.id).increment!((self.status + '_answers').to_sym) unless status == ''
  end

end
