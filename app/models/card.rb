class Card < ApplicationRecord
  validates :front, :back, presence: true
  has_many :questions
  has_many :answers

  mount_uploader :front_image, FrontUploader

  def number_of_answers
    correct_answers + wrong_answers + near_answers + hint_answers
  end


end
