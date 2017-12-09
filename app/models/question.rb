class Question < ApplicationRecord
  belongs_to :lesson
  belongs_to :card
end
