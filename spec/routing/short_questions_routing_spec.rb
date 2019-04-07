require "rails_helper"

RSpec.describe ShortQuestionsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/short_questions").to route_to("short_questions#index")
    end

    it "routes to #new" do
      expect(:get => "/short_questions/new").to route_to("short_questions#new")
    end

    it "routes to #show" do
      expect(:get => "/short_questions/1").to route_to("short_questions#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/short_questions/1/edit").to route_to("short_questions#edit", :id => "1")
    end


    it "routes to #create" do
      expect(:post => "/short_questions").to route_to("short_questions#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/short_questions/1").to route_to("short_questions#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/short_questions/1").to route_to("short_questions#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/short_questions/1").to route_to("short_questions#destroy", :id => "1")
    end
  end
end
