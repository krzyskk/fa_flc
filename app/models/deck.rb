# == Schema Information
#
# Table name: decks
#
#  id          :bigint(8)        not null, primary key
#  description :string           default(""), not null
#  name        :string           default(""), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :bigint(8)
#
# Indexes
#
#  index_decks_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#

class Deck < ApplicationRecord
  has_many :cards, dependent: :destroy
  has_many :lessons, dependent: :destroy
  belongs_to :user

  validates :name, :description, presence: true, format: /\w{2,}/
end
