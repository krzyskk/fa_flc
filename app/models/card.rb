class Card < ApplicationRecord
  enum word_class: { verb: 0, noun: 1, adjective: 2, adverb: 3, preposition: 4, pronoun: 5, conjunction: 6, interjection: 7, phrasal_verb: 8}

  validates :front, :back, presence: true, format: /[a-zA-Z]{2,}/
  validates :word_class, presence: true, inclusion: { in: word_classes.keys }

  has_many :answers, dependent: :destroy
  belongs_to :deck

  before_create :set_dates

  def set_dates
    self.last_showed_at = DateTime.now
    self.last_correct_answer = DateTime.now
    self.last_wrong_answer = DateTime.now
  end

  def set_memorized
    if answers.where(status: 'correct').count >= 3
      self.memorized = true
      self.marked_as_memorized = DateTime.now
      self.save!
      Lesson.last.increment!('memorized')
    end
  end

  def self.to_csv
    attributes = %w[front back correct_answers wrong_answers empty_answers]

    CSV.generate(headers: true) do |csv|
      csv << attributes
      all.each do |card|
        csv << card.attributes.values_at(*attributes)
      end
    end
  end
end
