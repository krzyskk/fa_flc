
class SpreadsheetImporter
  def initialize(user)
    require "google_drive"
    require "googleauth"
    session = GoogleDrive::Session.from_config({
      client_id: Rails.application.credentials.client_id,
      client_secret: Rails.application.credentials.client_secret
    }.to_json)

    spreadsheet = session.spreadsheet_by_title('arkusz_testowy')
    @worksheet = spreadsheet.worksheets[0]
  end

  def call(tasks)
    @worksheet.insert_rows(2, [['Name', 'Description', 'Start', 'End', 'Location', 'Summary']])
    tasks.each do |task|
      @worksheet.insert_rows(2, [[task.name, task.description, task.start, task.end, task.location, task.summary]])
    end
    @worksheet.save
  end
end