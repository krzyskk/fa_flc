# frozen_string_literal: true



class Deck < ApplicationRecord
  has_many :cards, dependent: :destroy
  has_many :lessons, dependent: :destroy
  belongs_to :user

  validates :name, :description, presence: true, format: /\w{2,}/

  def sample_words(limit = 15)
    cards.last(limit).pluck(:front).join(', ')
  end
end
