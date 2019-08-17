class Result < ApplicationRecord
  belongs_to :day 
  belongs_to :habit
    
  enum result: { deactivated: 0, success: 1, fail: 2, break: 3 } 
end
