class Card < ApplicationRecord
  validates :front, :back, presence: true
  has_many :questions
  has_many :answers
  belongs_to :deck

  mount_uploader :front_image, FrontUploader

  def number_of_answers
    correct_answers + wrong_answers + near_answers + hint_answers
  end

  def self.to_csv
    attributes = %w{front back correct_answers wrong_answers near_answers hint_answer}

    CSV.generate(headers: true) do |csv|
      csv << attributes
      all.each do |card|
        csv << card.attributes.values_at(*attributes)
      end
    end
  end

  def self.import(file)
    spreadsheet = open_spreadsheet(file)
    header = spreadsheet.row(1)
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      card.new!
      card.attributes = row.to_hash.slice(*accessible_attributes)
      card.save!
    end
  end

  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
    when ".csv" then Csv.new(file.path, nil, :ignore)
    when ".xls" then Excel.new(file.path, nil, :ignore)
    when ".xlsx" then Excelx.new(file.path, nil, :ignore)
    else raise "Unknown file type: #{file.original_filename}"
    end
  end


end
