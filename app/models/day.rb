class Day < ApplicationRecord
  has_many :results

  validates :date, uniqueness: true
end
