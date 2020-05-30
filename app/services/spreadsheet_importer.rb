# frozen_string_literal: true

class SpreadsheetImporter
  def initialize(user)
    require 'google_drive'
    require 'googleauth'
    # session = GoogleDrive::Session.from_config({
    #   client_id: Rails.application.credentials.client_id,
    #   client_secret: Rails.application.credentials.client_secret,
    # }.to_json)
    session = GoogleDrive.login_with_oauth(user.access_token)


    spreadsheet = session.spreadsheet_by_title('arkusz_testowy')
    @worksheet = spreadsheet.worksheets[0]
  end

  def call(cards)
    @worksheet
  end
end
