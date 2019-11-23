class Day < ApplicationRecord
  has_many :results
  has_many :chores
  belongs_to :user
  accepts_nested_attributes_for :results


  validates :date, uniqueness: true

  def day_name
    date.strftime('%a %-d %b')
  end
end
