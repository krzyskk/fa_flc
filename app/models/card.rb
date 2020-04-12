# frozen_string_literal: true

class Card < ApplicationRecord
  enum word_class: { verb: 0, noun: 1, adjective: 2, adverb: 3,
                     preposition: 4, pronoun: 5, conjunction: 6, interjection: 7,
                     phrasal_verb: 8, noun_pl: 9, sentence: 10 }

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
      deck.lessons.first.increment!('memorized')
    end
  end
end
