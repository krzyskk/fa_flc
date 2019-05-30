class CardDecorator < ApplicationDecorator
  delegate :id, :deck, :word_class

  def front_truncated
    object.front.truncate_words(7).truncate(50)
  end

  def back_truncated
    object.back.truncate_words(7).truncate(50)
  end

  def created_date
    object.created_at.strftime('%d %b')
  end

  def updated_date
    object.updated_at.strftime('%d %b')
  end

  def last_showed_date
    object.last_showed_at.strftime('%d %b %H:%M')
  end
end
