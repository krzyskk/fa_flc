class Task < ApplicationRecord
  belongs_to :day, optional: true 
end
