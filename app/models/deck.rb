# == Schema Information
#
# Table name: decks
#
#  id          :bigint(8)        not null, primary key
#  name        :string           default(""), not null
#  description :string           default(""), not null
#  user_id     :bigint(8)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Deck < ApplicationRecord
  has_many :cards, dependent: :destroy
  has_many :lessons, dependent: :destroy
  belongs_to :user

  validates :name, :description, presence: true, format: /\w{2,}/
end
