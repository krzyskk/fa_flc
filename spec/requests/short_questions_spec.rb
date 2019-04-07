require 'rails_helper'

RSpec.describe "ShortQuestions", type: :request do
  describe "GET /short_questions" do
    it "works! (now write some real specs)" do
      get short_questions_path
      expect(response).to have_http_status(200)
    end
  end
end
