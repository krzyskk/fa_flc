class CardDecorator < Draper::Decorator
  delegate_all
  decorates_association :cards

  def front_truncated
    card.front.truncate_words(7)
  end

  def back_truncated
    card.back.truncate_words(7)
  end

  def created_date
    card.created_at.strftime('%d %b')
  end

  def updated_date
    card.updated_at.strftime('%d %b')
  end

  def last_showed_date
    card.last_showed_at.strftime('%d %b %H:%M')
  end
end
