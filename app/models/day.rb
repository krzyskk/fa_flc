class Day < ApplicationRecord
  has_many :results
  accepts_nested_attributes_for :results


  validates :date, uniqueness: true
end
