class Card < ApplicationRecord
  validates :front, :back, presence: true
  has_many :answers, dependent: :destroy
  belongs_to :deck

  def number_of_answers
    correct_answers + wrong_answers + near_answers + hint_answers
  end

  def self.to_csv
    attributes = %w{front back correct_answers wrong_answers near_answers hint_answer}

    CSV.generate(headers: true) do |csv|
      csv << attributes
      all.each do |card|
        csv << card.attributes.values_at(*attributes)
      end
    end
  end

end
