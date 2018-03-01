class Answer < ApplicationRecord
  belongs_to :lesson
  belongs_to :card

  before_update :set_status, :update_card_counters

  def question
    card.front
  end

  def correct_answer
    card.back
  end

  private

  def set_status
    if answer == correct_answer
      self.status = 'correct'
    elsif answer == ''
      self.status = 'empty'
    else
      self.status = 'wrong'
    end
  end

  def update_card_counters
    card.update_attribute('last_showed_at', DateTime.now)
    card.increment!((status + '_answers').to_sym) unless status == ''
    card.update_attribute(('last_' + status + '_answer'), DateTime.now) unless status == '' || 'empty'
    card.set_memorized
  end
end
