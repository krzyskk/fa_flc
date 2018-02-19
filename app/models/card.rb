class Card < ApplicationRecord
  validates :front, :back, presence: true
  has_many :answers, dependent: :destroy
  belongs_to :deck

  def set_memorized
    if answers.where(status: 'correct').count >= 3
      self.memorized = true
      self.marked_as_memorized = Date.today
      Lesson.last.increment!('memorized')
    else
      self.memorized = false
    end
    self.save!
  end

  def self.to_csv
    attributes = %w{front back correct_answers wrong_answers empty_answers}

    CSV.generate(headers: true) do |csv|
      csv << attributes
      all.each do |card|
        csv << card.attributes.values_at(*attributes)
      end
    end
  end

end
