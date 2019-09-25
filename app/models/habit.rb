class Habit < ApplicationRecord
  belongs_to :user

  def self.active 
    where(active: 'true')
  end
end
