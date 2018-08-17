class CardDecorator < ApplicationDecorator
  delegate_all

  def front_truncated
    object.front.truncate_words(7)
  end

  def back_truncated
    object.back.truncate_words(7)
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
