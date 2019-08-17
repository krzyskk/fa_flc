module Admin
  class ActivitiesController < Admin::ApplicationController

    def index
      super

      client = Strava::OAuth::Client.new(
        client_id: '37929',
        client_secret: '550bf87572d03cb0b7eb83fd42fe9ce2a4d703af'
      )      
      activities = client.athlete_activities.first
      @resources = activities
    end


  end
end
