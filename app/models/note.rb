class Note < ApplicationRecord
  validates :content,
    presence: true, if: Proc.new { |e| e.title.blank? }
  
  validates :content,
    presence: true, if: Proc.new { |e| e.title.blank? }
end
