# frozen_string_literal: true

class CsvImporter
  def call(file_path)
    require 'csv'

    return unless file_path.present?
    data = []
    table = CSV.table(file_path)
    raise WrongColumnsError if (table.headers & [:front, :back]).count != 2
    table.each do |row|
      data << row.to_h.slice(:front, :back) if row.values_at(:front, :back).all?(&:present?)
    end
    data
  end
end
